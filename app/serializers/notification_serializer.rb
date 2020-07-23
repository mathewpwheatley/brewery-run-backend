class UserSerializerLogIn < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :content,
    :link,
    :read
  )
end