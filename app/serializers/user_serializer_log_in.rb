class UserSerializerLogIn < ActiveModel::Serializer
  attributes(
    :id,
    :full_name
  )
  has_many(:notifications, serializer: NotificationSerializer)
end