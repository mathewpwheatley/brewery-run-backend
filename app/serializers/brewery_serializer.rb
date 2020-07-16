class BrewerySerializer < ActiveModel::Serializer
  attributes(:name, :brewery_type, :full_house, :phone, :website_url)
end
