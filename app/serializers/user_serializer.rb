class UserSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :full_name,
    :about,
    :city_address,
    :public_circuits_count,
    :public_circuits_avg_rating,
    :followers_count,
    :active_user_follow_id,
    :public_circuits,
    :created_at
  )
  has_many(:public_circuits, serializer: CircuitSerializerIndex)
end