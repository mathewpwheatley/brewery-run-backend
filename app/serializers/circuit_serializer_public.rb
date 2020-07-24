class CircuitSerializerPublic < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :author_name,
    :description,
    :breweries_count,
    :likes_count,
    :active_user_like_id,
    :favorites_count,
    :active_user_favorite_id,
    :reviews_count,
    :rating
  )
  has_many(:breweries, serializer: BrewerySerializerIndex)
  has_many(:reviews, serializer: ReviewSerializer)
end
