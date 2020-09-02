class CircuitSerializerIndex < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :elevation,
    :distance,
    :breweries_count,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating
  )
end
