class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id, presence: true, length: { minimum: 2 }

  #validates :body, :allow_blank => false

  #:message => "Put some address please"

#  validates :body, presence: true, length: { maximum: 500 }

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
