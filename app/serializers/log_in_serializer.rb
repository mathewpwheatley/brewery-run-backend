class LogInSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :full_name,
    :notifications_count
  )
end