class CircuitSerializer < ActiveModel::Serializer
  attributes(:id, :title, :description, :public)
end
