class CircuitSerializer < ActiveModel::Serializer
  attributes(:id, :title, :description, :public, :favorites_count, :likes_count, :reviews_count, :rating)
end
