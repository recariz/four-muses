class ContestsController < ApplicationController
    before_action :set_post, only:[:show]

  def index
    @contests = policy_scope(Contest)
    @contests = Flat.geocoded # returns flats with coordinates
    @markers = @contests.map do |contest|
        {
        lat: contest.latitude,
        lng: contest.longitude
        }
  end

  def new
  end

  def create
  end

  def show
  end

private

  def set_params
    @contest = Contest.find(params[:id])
  end

  def strong_params
    params.require(:contest).permit(:start_date, :end_date, :location, :title, :content)
  end