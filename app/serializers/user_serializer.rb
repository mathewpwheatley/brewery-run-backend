class UserSerializer < ActiveModel::Serializer
  attributes(:id, :email, :full_name, :public_circuits_count, :followers_count)
end