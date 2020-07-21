class BreweryReview < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:brewery)
    belongs_to(:user)

    # ActiveRecord Validatons (See db schema for additional validators)
    validates(:title, presence: true)
    validates(:title, length: { in: 10..50 }
    validates(:content, presence: true)
    validates(:content, length: { in: 50..500 })
    validates(:rating, presence: true)
    validates(:rating, inclusion: { in: 0..5 })
    validates(:brewery_id, presence: true)
    validates(:brewery_id, numericality: { only_integer: true })
    validates(:user_id, presence: true)
    validates(:user_id, numericality: { only_integer: true })

    # Instance Methods
    def author_name
        self.user.full_name
    end
    
end
