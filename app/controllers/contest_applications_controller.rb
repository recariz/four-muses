class ContestApplicationsController < ApplicationController

    def new
        @contest_application = Contest.new
        authorize @contest_application
    end

    def create
    end

end
