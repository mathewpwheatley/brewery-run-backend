class Circuit < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)
    has_many(:breweries_circuits)
    has_many(:breweries, through: :breweries_circuits)
    # has_many(:circuit_favorites)
    has_many(:favorites, foreign_key: "circuit_id", class_name: "CircuitFavorite")
    # has_many(:circuit_likes)
    has_many(:likes, foreign_key: "circuit_id", class_name: "CircuitLike")
    # has_many(:circuit_reviews)
    has_many(:reviews, foreign_key: "circuit_id", class_name: "CircuitReview")

    # ActiveRecord Validatons (See db schema for additional validators)
    validates(:title, presence: true)
    validates(:title, length: { in: 10..50 })
    validates(:description, presence: true)
    validates(:description, length: { in: 25..200 })
    validates(:user_id, presence: true)
    validates(:user_id, numericality: { only_integer: true })

    # Instance Methods
    def author_name
        self.user.full_name
    end

    def breweries_count
        self.breweries.count
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

    def self.all_public
        self.all.where(public: true)
    end

end
