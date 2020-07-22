class UserSerializerActive < ActiveModel::Serializer
  attributes(
    :id,
    :email,
    :about,
    :full_name,
    :first_name,
    :middle_name,
    :last_name,
    :full_address,
    :street,
    :city,
    :state,
    :postal_code,
    :country
  )
end