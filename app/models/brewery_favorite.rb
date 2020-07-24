class BreweryFavorite < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:brewery)
    belongs_to(:user)

end
