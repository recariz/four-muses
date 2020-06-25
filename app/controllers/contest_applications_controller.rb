class ContestApplicationsController < ApplicationController
    before_action :set_params, only:[:edit, :update, :destroy]

    def index
        @contests = policy_scope(ContestApplication)
    end

    def new
        @contest_application = ContestApplication.new
        authorize @contest_application
    end

    def create
        @contest_application = ContestApplication.new(strong_params)
        authorize @contest_application
        @contest_application.user = current_user
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
    end

    def destroy
    end
    
    private

    def set_params
        @contest_application = ContestApplication.find(params[:id])
    end

    def strong_params
        params.require(:contest_application).permit(:photos, :motivation)
    end


end
