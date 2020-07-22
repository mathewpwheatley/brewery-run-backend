class BrewerySerializerPublic < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :brewery_type,
    :tag_list,
    :full_address,
    :phone,
    :website_url,
    :public_circuits_count,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating
  )
  has_many(:public_circuits, serializer: CircuitSerializerIndex)
  has_many(:reviews, serializer: ReviewSerializerIndex)
end
