class UserSerializerPublic < ActiveModel::Serializer
  attributes(
    :id,
    :full_name,
    :about,
    :city_address,
    :public_circuits_count,
    :public_circuits_avg_rating,
    :followers_count
  )
end