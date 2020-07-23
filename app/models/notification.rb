class Notification < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)

    # ActiveRecord Validatons (See db schema for additional validators)
    validates(:title, presence: true)
    validates(:title, length: { in: 10..50 })
    validates(:content, presence: true)
    validates(:content, length: { in: 10..100 })
    validates(:user_id, presence: true)
    validates(:user_id, numericality: { only_integer: true })

end
