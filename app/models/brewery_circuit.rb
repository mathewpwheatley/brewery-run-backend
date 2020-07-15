class BreweriesCircuit < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:brewery)
    belongs_to(:circuit)

    # ActiveRecord Validatons (See db schema for additional validators)

end
