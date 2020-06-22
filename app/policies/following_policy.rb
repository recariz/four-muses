class FollowingPolicy < ApplicationPolicy

  class Scope < Scope #the class scope and then the method resolve is actually the method that authorize all the instances of my clss Restaurant to be authorized
    def resolve
      scope.all #scope corresponds to the Restaurant class
    end
  end

  def create?
    rescue_from Pundit::NotAuthorizedError, with: :user_not_logged_in unless @user
  end

  private

  def user_not_logged_in
    flash[:alert] = "You need to be logged in to follow someone"
    redirect_to(request.referrer || new_artist_session_path)
  end
end
