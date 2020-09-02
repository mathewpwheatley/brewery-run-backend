class CircuitSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :author_name,
    :author_id,
    :description,
    :elevation,
    :distance,
    :breweries_count,
    :likes_count,
    :active_user_like_id,
    :favorites_count,
    :active_user_favorite_id,
    :reviews_count,
    :rating,
    :public,
    :created_at,
    :updated_at
  )
  has_many(:breweries, serializer: BrewerySerializerIndex)
  has_many(:reviews, serializer: ReviewSerializer)
end
