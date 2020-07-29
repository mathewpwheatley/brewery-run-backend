class UserSerializerIndex < ActiveModel::Serializer
  attributes(
    :id,
    :full_name,
    :public_circuits_count,
    :public_circuits_avg_rating,
    :followers_count
  )
end