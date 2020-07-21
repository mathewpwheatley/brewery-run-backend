class CircuitIndexSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating
  )
end
