class BrewerySerializer < ActiveModel::Serializer
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
    :active_user_like_id,
    :favorites_count,
    :active_user_favorite_id,
    :reviews_count,
    :public_circuits_count
  )
  has_many(:public_circuits, serializer: CircuitSerializerIndex)
  has_many(:reviews, serializer: ReviewSerializer)
end
