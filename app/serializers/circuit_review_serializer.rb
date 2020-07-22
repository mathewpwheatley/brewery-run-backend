class CircuitReviewSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :author_name,
    :author_id,
    :rating,
    :circuit_title,
    :circuit_id
  )
end
