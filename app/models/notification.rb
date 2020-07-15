class Notification < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)

    # ActiveRecord Validatons (See db schema for additional validators)
    
end
