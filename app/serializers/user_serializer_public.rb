class UserSerializerPublic < ActiveModel::Serializer
  attributes(
    :id,
    :full_name,
    :about,
    :city_address,
    :public_circuits_count,
    :public_circuits_avg_rating,
    :followers_count,
    :public_circuits
  )
  has_many :public_circuits, serializer: CircuitSerializer
end