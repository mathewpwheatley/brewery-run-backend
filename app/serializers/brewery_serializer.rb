class BrewerySerializer < ActiveModel::Serializer
  attributes(:id, :name, :brewery_type, :full_address, :phone, :website_url)
end
