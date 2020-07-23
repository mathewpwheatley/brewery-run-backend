class UserSerializerActive < ActiveModel::Serializer
  attributes(
    :id,
    :email,
    :about,
    :full_name,
    :full_address,
    :favorite_breweries_count,
    :brewery_reviews_count,
    :circuits_count,
    :public_circuits_count,
    :public_circuits_avg_rating,
    :favorite_circuits_count,
    :circuit_reviews_count,
    :followers_count,
    :following_count,
  )
  has_many(:private_circuits, serializer: CircuitSerializerIndex)
  has_many(:public_circuits, serializer: CircuitSerializerIndex)
  has_many(:favorite_circuits, serializer: CircuitSerializerIndex)
  has_many(:public_followees_circuits, serializer: CircuitSerializerIndex)
  has_many(:favorite_breweries, serializer: BrewerySerializerIndex)
  has_many(:circuit_reviews, serializer: ReviewSerializer)
  has_many(:brewery_reviews, serializer: ReviewSerializer)
  

end