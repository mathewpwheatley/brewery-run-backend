class CircuitSerializerIndex < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :breweries_count,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating
  )
end
