class BreweryFavorite < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:brewery)
    belongs_to(:user)

    # ActiveRecord Validatons (See db schema for additional validators)
        
end
