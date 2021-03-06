
class Service
  include DataMapper::Resource

  property :href,           Href,   :key => true, :serial => true
  property :name,           String, :nullable => false
  property :resource_href,  Href,   :nullable => false

  property :created_at,     DateTime
  property :updated_at,     DateTime

  def self.[](name)
    first(:name => name.to_s)
  end

  def self.register(name, resource_href)
    if service = self.first(:name => name.to_s)
      service.resource_href = resource_href
      service.save
    else
      service = self.create(:name => name.to_s,
                            :resource_href => resource_href)
    end

    service
  end


end
