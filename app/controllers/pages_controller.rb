class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    if current_user.artist?
      @my_applications = current_user.contest_applications
    elsif current_user.business?
      @my_contests = current_user.contests
      @my_applications_requests = current_user.applications.order(created_at: :desc)
    end
  end


end


