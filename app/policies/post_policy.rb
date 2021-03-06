class PostPolicy < ApplicationPolicy
  class Scope < Scope #the class scope and then the method resolve is actually the method that authorize all the instances of my clss Restaurant to be authorized
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    rescue_from Pundit::NotAuthorizedError, with: :user_not_logged_in unless user.present?
    true
  end

  def update?
    is_an_owner_or_an_admin?
    true
  end

  def destroy?
    is_an_owner_or_an_admin?
    true
  end

  def like?
    true
  end

  def dislike?
    true
  end

  private

  def is_an_owner_or_an_admin?
    user.id == record.user.id || user.admin
  end

  def user_not_logged_in
    flash[:alert] = "You need to be logged in to upload a post"
    redirect_to(request.referrer || new_user_session_path)
  end

end
