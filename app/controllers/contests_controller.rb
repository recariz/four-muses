class ContestsController < ApplicationController
    before_action :set_params, only:[:show]

  def index
    @contests = policy_scope(Contest)
    @contests = Contest.geocoded # returns flats with coordinates
    @markers = @contests.map do |contest|
      {
      lat: contest.latitude,
      lng: contest.longitude
      }
    end
end

  def new
    @contest = Contest.new(strong_params)
    authorize @contest
  end

  def create
    @contest = Contest.new(strong_params)
    autorize @contest
    @contest.user = current_user
    if @contest.save
        redirect_to root_path, notice: "Posting"
        # GUYS WE NEED TO CHANGE THE REDIRECT ONCE WE HAVE THE FEED
      else
        render :new
    end
  end

  def show
    authorize @contest
    @markers = [
      {
        lat: @contest.latitude,
        lng: @contest.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { contest: @contest }),
      }
    ]
  end

private

  def set_params
    @contest = Contest.find(params[:id])
  end

  def strong_params
    params.require(:contest).permit(:start_date, :end_date, :location, :title, :content)
  end
end