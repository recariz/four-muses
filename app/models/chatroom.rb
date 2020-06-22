class Chatroom < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :reciever, foreign_key: :reciever_id, class_name: 'User'

  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :reciever_id

  scope :involving, -> (user) {
    where("chats.sender_id = ? OR chats.reciever_id = ?", user.id, user.id)
  }

  scope :between, -> (user_A, user_B) {
    where("(chats.sender_id = ? AND chats.reciever_id = ?) OR (chats.sender_id = ? AND chats.recieverid = ?)", user_A, user_B, user_B, user_A)
  }
e
end
