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

    private

    def set_params
        @contest_application = ContestApplication.find(params[:id])
    end

    def strong_params
        params.require(:contest_application).permit(:motivation, :status, photos: [])
    end


end
