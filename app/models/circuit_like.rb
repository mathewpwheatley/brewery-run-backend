class CircuitLike < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:circuit)
    belongs_to(:user)
    
end
