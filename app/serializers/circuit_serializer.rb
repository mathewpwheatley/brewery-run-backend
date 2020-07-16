class CircuitSerializer < ActiveModel::Serializer
  attributes(:title, :description, :public, :breweries)
end
