class BrewerySerializerIndex < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :brewery_type,
    :tag_list,
    :public_circuits_count,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating
  )
end
