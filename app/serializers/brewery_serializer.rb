class BrewerySerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :brewery_type,
    :tag_list,
    :full_address,
    :phone,
    :website_url,
    :favorites_count,
    :likes_count,
    :reviews_count,
    :rating)
end
