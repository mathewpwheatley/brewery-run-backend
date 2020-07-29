class ReviewSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :author_name,
    :author_id,
    :rating,
    :subject_name,
    :subject_id,
    :content,
    :created_at
  )
end
