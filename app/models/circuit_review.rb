class CircuitReview < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:circuit)
    belongs_to(:user)

    # ActiveRecord Validatons (See db schema for additional validators)
    validates(:title, length: { in: 10..50 })
    validates(:content, length: { in: 50..500 })
    validates(:rating, inclusion: { in: 0..5 })

    # Instance Methods
    def author_name
        self.user.full_name
    end

    def author_id
        self.user.id
    end

    def subject_name
        self.circuit.title
    end

    def subject_id
        self.circuit.id
    end

    def new_review_notification
        circuit = Circuit.find(self.circuit_id)
        user_name = User.find(self.user_id).full_name
        title = "You got a new circuit review!"
        content = "#{user_name} just wrote a review on #{circuit.title} with a rating of #{self.rating}. "
        link = "/circuits/#{circuit.id}"
        Notification.create(title: title, content: content, link: link, user_id: circuit.user.id)
    end

end