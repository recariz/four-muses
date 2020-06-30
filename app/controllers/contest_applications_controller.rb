class ContestApplicationsController < ApplicationController
    before_action :set_params, only: [:edit, :update, :destroy, :show]

    def index
        @contests = policy_scope(ContestApplication)
    end
    # added show for stripe


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
            success_url: contest_application_url(@contest_application),
            cancel_url: contest_application_url(@contest_application)
          )

          @contest_application.update(checkout_session_id: session.id)
          redirect_to new_contest_application_payment_path(@contest_application)
        else
            render :new
        end
    end
    def show

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

    private

    def set_params
      @contest_application = ContestApplication.find(params[:id])
      authorize @contest_application
    end

    def strong_params
        params.require(:contest_application).permit(:motivation, :status, photos: [])
    end


end
