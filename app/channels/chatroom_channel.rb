class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    Chatroom.involving(current_user).each do |chatroom|
      stream_from "chatroom_#{chatroom.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(payload)
    message = Message.new(user: current_user, chatroom_id: payload["id"], content: payload["content"])
    ActionCable.server.broadcast "chatroom_#{payload['id']}", message: render(message) if message.save
  end

  private

  def render(message)
    ApplicationController.render(
      partial: "messages/message",
      locals: { message: message }
    )
  end



end
