class CircuitFavorite < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:circuit)
    belongs_to(:user)

    # Instance Methods

    def new_favorite_notification
        circuit = Circuit.find(self.circuit_id)
        user_name = User.find(self.user_id).full_name
        title = "Your circuit is my favorite!"
        content = "#{user_name} just favorited your circuit #{circuit.title}. "
        link = "/circuits/#{circuit.id}"
        Notification.create(title: title, content: content, link: link, user_id: circuit.user.id)
    end
 
end