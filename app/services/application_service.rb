class ApplicationService 
  attr_reader :result
  
  def self.call(*args, &block)
    new(*args, &block).tap do |service|
      service.instance_variable_set("@result", service.call)
    end
  end
end