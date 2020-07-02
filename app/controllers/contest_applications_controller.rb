class ContestApplicationsController < ApplicationController

    before_action :set_params, only: [:edit, :update, :destroy, :show]

    def index
      @contests = policy_scope(ContestApplication)
    end
    # added show for stripe


    def show
      @user = @contest_application.user
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
      @contest_application.user_id = current_user.id
      @contest_application.amount = @contest.contest_price
      authorize @contest_application

      if @contest_application.save
        # redirect_to root_path, notice: "Applying"

        session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: "Four Muses Application for #{@contest.title}",
            images: [url_for(@contest.photo)],
            amount: Contest::CONTEST_APPLICATION_PRICE_CENTS,
            currency: 'eur',
            quantity: 1
          }],
          success_url: "http://www.four-muses.com/contest_applications/#{@contest_application.id}",
          cancel_url: "http://www.four-muses.com/contest_applications/#{@contest_application.id}"
        )

        p contest_application_url(@contest_application)


        @contest_application.update(checkout_session_id: session.id)
        redirect_to new_contest_application_payment_path(@contest_application)
      else
          render :new
      end
    end

    def edit
    end

    def update
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
          send_accepted_messages(@application, @sender, @receiver)
       elsif @application.rejected?
          send_rejected_messages(@application, @sender, @receiver)
       end
       respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js
      end
    end


    private

    def send_accepted_messages (application, sender, receiver)
      @chatroom = Chatroom.between(sender, receiver).first_or_create!(sender_id: sender.id, receiver_id: receiver.id)
      authorize @chatroom
      @message = @chatroom.messages.new(user_id: sender.id, content: "🏅 Congratulations #{application.user.first_name.capitalize}! Your application to '#{application.contest.title}' has been accepted!")
      authorize @message
      @message.save
      @message2 = @chatroom.messages.new(user_id: sender.id, content: "We will contact you soon regarding next steps")
      authorize @message2
      @message2.save
    end

    def send_rejected_messages (application, sender, receiver)
      @chatroom = Chatroom.between(sender, receiver).first_or_create!(sender_id: sender.id, receiver_id: receiver.id)
      authorize @chatroom
      @message = @chatroom.messages.new(user_id: sender.id, content: "😔 We regret to inform you that your application to '#{application.contest.title}'' has been rejected. ")
      authorize @message
      @message.save
      @message2 = @chatroom.messages.new(user_id: sender.id, content: "Thanks for your participation #{application.user.first_name.capitalize}.")
      authorize @message2
      @message2.save
    end


    def set_params
      @contest_application = ContestApplication.find(params[:id])
      authorize @contest_application
    end

    def strong_params
        params.require(:contest_application).permit(:motivation, :status, photos: [])
    end


end
