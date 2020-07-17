class User < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:brewery_favorites)
    has_many(:favorite_breweries, through: :brewery_favorites, source: :brewery)
    has_many(:brewery_likes)
    has_many(:brewery_reviews)
    has_many(:circuits)
    has_many(:circuit_favorites)
    has_many(:favorite_circuits, through: :circuit_favorites, source: :circuit)
    has_many(:circuit_likes)
    has_many(:circuit_reviews)
    has_many(:follower_follows, foreign_key: :followee_id, class_name: "Follow")
    has_many(:followers, through: :follower_follows, source: :follower)
    has_many(:followee_follows, foreign_key: :follower_id, class_name: "Follow")
    has_many(:followees, through: :followee_follows, source: :followee)
    has_many(:notifications)

    # ActiveRecord Validatons (See db schema for additional validators)
    validates(:first_name, presence: true)
    validates(:last_name, presence: true)
    validates(:email, presence: true)
    validates(:email, confirmation: true)
    validates(:email, uniqueness: true)
    validates(:password, presence: true)
    validates(:password, confirmation: true)

    # ActiveMethod Password Methods
    has_secure_password

    # Instance Methods
    def name
        "#{self.first_name} #{self.last_name}".split.join(" ")
    end

    def full_name
        "#{self.first_name} #{self.middle_name} #{self.last_name}".split.join(" ")
    end

    def full_address
        "#{self.street}, #{self.city}, #{self.state} #{self.postal_code}, #{self.country}"
    end

    def favorite_breweries_count
        self.favorite_breweries.count
    end

    def circuits_count
        self.circuits.count
    end

    def public_favorite_circuits
        self.favorite_circuits.where(public: true)
    end

    def public_favorite_circuits_count
        self.public_favorite_circuits.count
    end

    def followers_count
        self.followers.count
    end

    def public_followees_circuits_count
        self.public_followees_circuits.count
    end

    def public_followees_circuits
        self.followees.map{|followee| followee.circuits.where(public: true)}.flatten
    end

end