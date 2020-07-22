class ReviewSerializerIndex < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :author_name,
    :rating
  )
end
