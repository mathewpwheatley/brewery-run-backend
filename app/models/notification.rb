class Notification < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)

    # ActiveRecord Validatons (See db schema for additional validators)
    validates(:title, length: { in: 10..50 })
    validates(:content, length: { in: 10..100 })

end
