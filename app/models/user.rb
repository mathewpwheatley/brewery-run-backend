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
    validates(:email, uniqueness: true)
    validates(:password, presence: true)
    validates(:password, confirmation: true)

    # ActiveMethod Password Methods
    has_secure_password

    # Instance Methods
    def full_name
        "#{self.first_name} #{self.middle_name} #{self.last_name}".split.join(" ")
    end

    def full_address
        "#{self.street}, #{self.city}, #{self.state} #{self.postal_code}, #{self.country}".split.join(" ")
    end

    def city_address
        "#{self.city}, #{self.state}, #{self.country}".split.join(" ")
    end

    def favorite_breweries_count
        self.favorite_breweries.count
    end

    def brewery_reviews_count
        self.brewery_reviews.count
    end

    def circuits_count
        self.circuits.count
    end

    def public_circuits
        self.circuits.where(public: true)
    end

    def public_circuits_count
        self.public_circuits.count
    end

    def public_circuits_avg_rating
        rated_circuits = self.public_circuits.filter{|circuit| !circuit.rating.is_a? String}
        rated_circuits_count = rated_circuits.count
        if rated_circuits_count > 0
            (rated_circuits.reduce(0){|sum, circuit| sum + circuit.rating}.to_f/rated_circuits_count).round(2)
        else
            "N/A"
        end
    end

    def private_circuits
        self.circuits.where(public: false)
    end

    def private_circuits_count
        self.private_circuits.count
    end

    def private_circuits_avg_rating
        rated_circuits = self.private_circuits.filter{|circuit| !circuit.rating.is_a? String}
        rated_circuits_count = rated_circuits.count
        if rated_circuits_count > 0
            (rated_circuits.reduce(0){|sum, circuit| sum + circuit.rating}.to_f/rated_circuits_count).round(2)
        else
            "N/A"
        end
    end

    def favorite_circuits_count
        self.favorite_circuits.count
    end

    def public_favorite_circuits
        self.favorite_circuits.where(public: true)
    end

    def public_favorite_circuits_count
        self.public_favorite_circuits.count
    end

    def circuit_reviews_count
        self.circuit_reviews.count
    end

    def followers_count
        self.followers.count
    end

    def following_count
        self.followees.count
    end

    def public_followees_circuits
        self.followees.map{|followee| followee.circuits.where(public: true)}.flatten
    end

    def public_followees_circuits_count
        self.public_followees_circuits.count
    end

    def active_user_follow_id
        follow = Follow.find_by(followee_id: self.id, follower_id: User.current.id)
        if follow
            follow.id
        else
            false
        end
    end

    def notifications_count
        self.notifications.count
    end

    def new_user_notification
        title = "Welcome #{self.first_name}!"
        content = "Thank you for joining Beer Run! Start discoverering new circuits here."
        link = "/circuits"
        Notification.create(title: title, content: content, link: link, user_id: self.id)
      end

    # Class Methods
    # The below two methods were pulled from https://stackoverflow.com/questions/2513383/access-current-user-in-model
    def self.current
        Thread.current[:user]
    end

    def self.current=(user)
        Thread.current[:user] = user
    end

end