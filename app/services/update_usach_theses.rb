class UpdateUsachTheses < ApplicationService
  BASE_URL = Rails.application.credentials.usach[:theses_base_url_access]

  def call
    initial_url = "#{BASE_URL}request?verb=ListRecords&metadataPrefix=oai_qdc&set=Tesis_se_autoriza"
    parsed_xml = HTTParty.get(initial_url)
    return false if parsed_xml.dig('OAI_PMH', 'error').present?
    
    actual_time = Time.now
    loop do
      theses_collector = []
      theses_records = parsed_xml.dig('OAI_PMH', 'ListRecords', 'record')
      theses_records.each do |record|
        theses_collector << {
          identifier: record.dig('header', 'identifier'),
          metadata: record.dig('metadata', 'dc')
        }
      end
      theses_collector.each do |thesis|
        thesis_found = Document.find_by(identifier: thesis[:identifier])
        thesis_found.update!(metadata: thesis[:metadata], updated_at: actual_time) if thesis.present?
      end
      
      resumption_token = parsed_xml.dig('OAI_PMH', 'ListRecords', 'resumptionToken')
      break unless resumption_token.present?
      next_page_url = "#{BASE_URL}request?verb=ListRecords&resumptionToken=#{resumption_token}"
      parsed_xml = HTTParty.get(next_page_url)
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end