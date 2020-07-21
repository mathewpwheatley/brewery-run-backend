class CircuitSerializerPublic < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :description,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating
  )
end
