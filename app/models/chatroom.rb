class Chatroom < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'

  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :receiver_id

  scope :involving, -> (user) {
    where("chats.sender_id = ? OR chats.receiver_id = ?", user.id, user.id)
  }

  scope :between, -> (user_A, user_B) {
    where("(chats.sender_id = ? AND chats.receiver_id = ?) OR (chats.sender_id = ? AND chats.receiver_id = ?)", user_A, user_B, user_B, user_A)
  }
e
end
