class BackfillUsachTheses < ApplicationService
  # Later, add this to Rails Credentials
  BASE_URL = 'https://na06.alma.exlibrisgroup.com/view/oai/56USACH_INST/'

  def call
    initial_url = "#{BASE_URL}request?verb=ListRecords&metadataPrefix=oai_qdc&set=Tesis_se_autoriza"
    parsed_xml = HTTParty.get(initial_url)
    return false if parsed_xml.dig('OAI_PMH', 'error').present?
    
    theses_collector = []
    actual_time = Time.now
    Document.transaction do
      loop do
        theses_records = parsed_xml.dig('OAI_PMH', 'ListRecords', 'record')
        theses_records.each do |record|
          theses_collector << {
            identifier: record.dig('header', 'identifier'),
            metadata: record.dig('metadata', 'dc'),
            type: Document.types[:thesis],
            created_at: actual_time,
            updated_at: actual_time,
          }
        end
        resumption_token = parsed_xml.dig('OAI_PMH', 'ListRecords', 'resumptionToken')
        break unless resumption_token.present?
        next_page_url = "#{BASE_URL}request?verb=ListRecords&resumptionToken=#{resumption_token}"
        parsed_xml = HTTParty.get(next_page_url)
      end
      Document.bulk_import!(theses_collector)
      raise ActiveRecord::RecordInvalid
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end