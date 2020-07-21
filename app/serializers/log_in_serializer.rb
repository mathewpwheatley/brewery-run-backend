class LogInSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :full_name
  )
end