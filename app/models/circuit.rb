class Circuit < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)
    has_many(:breweries_circuits)
    has_many(:circuit_favorites)
    has_many(:circuit_likes)
    has_many(:circuit_reviews)

    # ActiveRecord Validatons (See db schema for additional validators)

    # Instance Methods
    def favorites_count
        self.circuit_favorites.count
    end

    def likes_count
        self.circuit_likes.count
    end

    def reviews_count
        self.circuit_reviews.count
    end

end
