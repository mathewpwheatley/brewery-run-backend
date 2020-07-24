class Follow < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:follower, foreign_key: "follower_id", class_name: "User")
    belongs_to(:followee, foreign_key: "followee_id", class_name: "User")

    # Instance Methods
    
    def new_follow_notification
        user_name = User.find(self.follower_id).full_name
        title = "Well, someones popular!"
        content = "#{user_name} just started following you."
        Notification.create(title: title, content: content, user_id: self.followee.id)
    end

end