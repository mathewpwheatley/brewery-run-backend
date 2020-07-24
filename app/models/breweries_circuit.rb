class BreweriesCircuit < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:brewery)
    belongs_to(:circuit)

end
