class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates_presence_of :content, :chatroom_id, :user_id

  def message_time
    created_at.strftime("%d %b, %Y")
  end

end
