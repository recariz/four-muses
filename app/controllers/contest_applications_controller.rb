class ContestApplicationsController < ApplicationController
    before_action :set_params, only:[:edit, :update, :destroy]

    def index
        @contests = policy_scope(ContestApplication)
    end

    def new
        @contest = Contest.find(params[:contest_id])
        @contest_application = ContestApplication.new
        authorize @contest_application

    end

    def create
        @contest = Contest.find(params[:contest_id])
        @contest_application = ContestApplication.new(strong_params)
        @contest_application.contest = @contest
        @contest_application.user = current_user
        authorize @contest_application
        if @contest_application.save
            #Need to change path
            redirect_to root_path, notice: "Applying"
        else
            render :new
        end
    end

    def edit
    end

    def update
      @contest_application = ContestApplication.find(params[:id])
      authorize @contest_application
      if @contest_application.update(strong_params)
        flash[:notice] = 'Contest application updated'
      else
        flash[:alert] = "Something went wrong, could not update status"
      end
      redirect_to dashboard_path
    end

    def destroy
    end


    def change_status
    @application = ContestApplication.find(params[:id])
    @application.status = params[:contest_application][:status]
    @application.save
    @receiver = @application.user
    @sender = @application.contest.user
     if @application.accepted?
        @chatroom = Chatroom.between(@sender, @receiver).first_or_create!(sender_id: @sender.id, receiver_id: @receiver.id)
        authorize @chatroom
        @message = @chatroom.messages.new(user_id: @sender.id, content: "Congratulations #{@application.user.first_name.capitalize}! Your application to #{@application.contest.title} has been accepted!")
        authorize @message
        @message.save
        @message2 = @chatroom.messages.new(user_id: @sender.id, content: "We will contact you soon regarding next steps")
        authorize @message2
        @message2.save
     elsif @application.rejected?
        @chatroom = Chatroom.between(@sender, @receiver).first_or_create!(sender_id: @sender.id, receiver_id: @receiver.id)
        authorize @chatroom
        authorize @chatroom
        @message = @chatroom.messages.new(user_id: @sender.id, content: "We regret to inform you that your application to #{@application.contest.title} has been rejected. ")
        authorize @message
        @message.save
        @message2 = @chatroom.messages.new(user_id: @sender.id, content: "Thanks for your participation #{@application.user.first_name.capitalize}.")
        authorize @message2
        @message2.save
     end


    end


    private

    def set_params
        @contest_application = ContestApplication.find(params[:id])
    end

    def strong_params
        params.require(:contest_application).permit(:motivation, :status, photos: [])
    end


end
