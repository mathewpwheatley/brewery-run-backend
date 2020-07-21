class Brewery < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:breweries_circuits)
    has_many(:circuits, through: :breweries_circuits)
    # has_many(:brewery_favorites)
    has_many(:favorites, foreign_key: "brewery_id", class_name: "BreweryFavorite")
    # has_many(:brewery_likes)
    has_many(:likes, foreign_key: "brewery_id", class_name: "BreweryLike")
    # has_many(:brewery_reviews)
    has_many(:reviews, foreign_key: "brewery_id", class_name: "BreweryReview")
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
        self.favorites.count
    end

    def likes_count
        self.likes.count
    end

    def reviews_count
        self.reviews.count
    end

    def rating
        if reviews_count > 0 
            (self.reviews.reduce(0){|sum, review| sum + review.rating}.to_f/self.reviews_count).round(2)
        else
            "N/A"
        end
    end

end
