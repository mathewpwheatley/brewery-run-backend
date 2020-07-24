class CircuitFavorite < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:circuit)
    belongs_to(:user)
 
end