class CircuitSerializerPublic < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :author_name,
    :author_id,
    :description,
    :distance,
    :elevation,
    :breweries_count,
    :likes_count,
    :favorites_count,
    :reviews_count,
    :rating,
    :public,
    :created_at,
    :updated_at
  )
  has_many(:breweries, serializer: BrewerySerializerIndex)
  has_many(:reviews, serializer: ReviewSerializer)
end
