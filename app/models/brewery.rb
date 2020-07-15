class Brewery < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:breweries_circuits)
    has_many(:brewery_favorites)
    has_many(:brewery_likes)
    has_many(:brewery_reviews)
    serialize(:tag_list)

    # ActiveRecord Validatons (See db schema for additional validators)

    # Instance Methods
    def full_address
        "#{self.street}, #{self.city}, #{self.state} #{self.postal_code}, #{self.country}"
    end

    def coordinates
        "#{self.latitude}, #{self.longitude}"
    end

    def favorites_count
        self.brewery_favorites.count
    end

    def likes_count
        self.brewery_likes.count
    end

    def reviews_count
        self.brewery_reviews.count
    end

end
