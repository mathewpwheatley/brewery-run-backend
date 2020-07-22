class BreweryReviewSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :author_name,
    :author_id,
    :rating,
    :brewery_name,
    :brewery_id
  )
end
