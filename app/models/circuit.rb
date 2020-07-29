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
    validates(:title, length: { in: 10..50 })
    validates(:description, length: { in: 25..200 })

    # Accepted nested attributes
    accepts_nested_attributes_for(:breweries_circuits)

    # Instance Methods
    def author_name
        self.user.full_name
    end

    def author_id
        self.user.id
    end

    def breweries_count
        self.breweries.count
    end

    def favorites_count
        self.favorites.count
    end

    def active_user_favorite_id
        favorite = CircuitFavorite.find_by(circuit_id: self.id, user_id: User.current.id)
        if favorite
            favorite.id
        else
            false
        end
    end

    def likes_count
        self.likes.count
    end

    def active_user_like_id
        like = CircuitLike.find_by(circuit_id: self.id, user_id: User.current.id)
        if like
            like.id
        else
            false
        end
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
