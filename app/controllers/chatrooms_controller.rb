class ChatroomsController < ApplicationController

  before_action :authenticate_user!

  def index
    @chatrooms = policy_scope(Chatroom)
    # will give us all the chatroom for the current user since in the policy I have changed to user which is current user in pundit
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @other_user = @chatroom.other_user(current_user)
    @messages = @chatroom.messages.order(created_at: :asc).last(20)
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.between(params[:sender_id], params[:receiver_id]).first_or_create!(chatroom_params)
    authorize @chatroom
    redirect_to @chatroom
  end

  private

  def chatroom_params
    params.permit(:sender_id, :receiver_id)
  end

end
