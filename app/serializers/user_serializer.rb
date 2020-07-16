class UserSerializer < ActiveModel::Serializer
  attributes(:id, :email, :full_name, :full_address, :about)
end