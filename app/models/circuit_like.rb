class CircuitLike < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:circuit)
    belongs_to(:user)

    # ActiveRecord Validatons (See db schema for additional validators)
    
end
