class UserIndexSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :full_name,
    :public_circuits_count,
    :followers_count
  )
end