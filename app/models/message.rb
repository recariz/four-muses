class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates_presence_of :content, :chatroom_id, :user_id
  delegate :nickname, to: :user, prefix: true # so we can access user nickname directly

  def message_time
    created_at.strftime("%l:%M%p")
  end

end
