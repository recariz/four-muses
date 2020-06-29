class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    @message = @chatroom.messages.new(message_params)
    @message.user = current_user
    authorize @message
    # @messages = @chatroom.messages.order(created_at: :desc)

    if @message.save
      redirect_to chatroom_path(@chatroom)
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
