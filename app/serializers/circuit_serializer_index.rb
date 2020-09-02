class CircuitSerializerIndex < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :distance,
    :elevation,
    :breweries_count,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating
  )
end
