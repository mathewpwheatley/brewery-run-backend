class BrewerySerializerIndex < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :brewery_type,
    :tag_list,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating
  )
end
