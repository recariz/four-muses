class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    @message = @chatroom.messages.new(message_params)
    @message.user = current_user
    authorize @message
    # @messages = @chatroom.messages.order(created_at: :desc)

    if @message.save
      ActionCable.server.broadcast "chatroom_#{@chatroom.id}", {
        user_is_author_partial: render_message(@message),
        user_is_not_author: render_not_message(@message),
        message_author: @message.user.id
      }
      # redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    render_to_string(partial: "message", locals: { message: @message, other_user: @chatroom.other_user(current_user), user_is_author: true })
  end

  def render_not_message(message)
    render_to_string(partial: "message", locals: { message: @message, other_user: @chatroom.other_user(current_user), user_is_author: false })
  end

end
