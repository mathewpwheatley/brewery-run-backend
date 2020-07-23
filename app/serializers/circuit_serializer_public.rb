class CircuitSerializerPublic < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :author_name,
    :description,
    :breweries_count,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating
  )
  has_many(:breweries, serializer: BrewerySerializerIndex)
  has_many(:reviews, serializer: ReviewSerializer)
end
