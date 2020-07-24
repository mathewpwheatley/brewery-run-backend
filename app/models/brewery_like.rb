class BreweryLike < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:brewery)
    belongs_to(:user)

end
