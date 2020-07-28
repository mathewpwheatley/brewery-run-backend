class BrewerySerializerPublic < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :brewery_type,
    :full_address,
    :longitude,
    :latitude,
    :phone,
    :website_url,
    :rating,
    :likes_count,
    :favorites_count,
    :reviews_count,
    :public_circuits_count
  )
  has_many(:public_circuits, serializer: CircuitSerializerIndex)
  has_many(:reviews, serializer: ReviewSerializer)
end
