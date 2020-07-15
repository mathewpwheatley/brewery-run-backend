class Follow < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:follower, foreign_key: "follower_id", class_name: "User")
    belongs_to(:followee, foreign_key: "followee_id", class_name: "User")

    # ActiveRecord Validatons (See db schema for additional validators)

end