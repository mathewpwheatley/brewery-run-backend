class CircuitLike < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:circuit)
    belongs_to(:user)

    # Instance Methods

    def new_like_notification
        circuit = Circuit.find(self.circuit_id)
        user_name = User.find(self.user_id).full_name
        title = "Your circuit is getting some attention!"
        content = "#{user_name} just liked your circuit #{circuit.title}. "
        link = "/circuits/#{circuit.id}"
        Notification.create(title: title, content: content, link: link, user_id: circuit.user.id)
      end
    
end
