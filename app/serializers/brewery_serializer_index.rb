class BrewerySerializerIndex < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :brewery_type,
    :rating,
    :likes_count,
    :favorites_count,
    :reviews_count,
    :public_circuits_count
  )
end
