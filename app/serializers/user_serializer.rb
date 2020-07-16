class UserSerializer < ActiveModel::Serializer
  attributes(:email, :full_name, :full_address, :about)
end