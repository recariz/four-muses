class ContestsController < ApplicationController
    before_action :set_params, only:[:show]

  def index
    @contests = policy_scope(Contest)
    if params[:query].present?
      @contests = Contest.where("location ILIKE ?", "%#{params[:query]}%").geocoded
    else
      @contests = Contest.all.geocoded
    end
    @markers = @contests.map do |contest|
      {
      lat: contest.latitude,
      lng: contest.longitude
      }
    end
  end

  def new
    @contest = Contest.new
    authorize @contest

  end

  def create
    @contest = Contest.new(strong_params)
    @contest_tag = ContestTag.new(contest_tag_params, contest_id: @contest.id)
    authorize @contest
    @contest.user = current_user
    puts @contest.errors.full_messages
    if @contest.save
        redirect_to contests_path
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
    params.require(:contest).permit(:start_date, :end_date, :location, :title, :content, :city, :photo)
  end

  def contest_tag_params
    params.require(:contest_tag).permit(:category_id)
  end

end











































