class MessagePolicy < ApplicationPolicy
  class Scope < Scope #the class scope and then the method resolve is actually the method that authorize all the instances of my clss Restaurant to be authorized
    def resolve
      scope.all #scope corresponds to the Restaurant class
    end
  end

  def create?
    true
  end

  def destroy?
    is_an_owner_or_an_admin?
  end

  private

  def is_an_owner_or_an_admin?
    user.id == @record.user.id || @user.admin
  end

  #   def user_not_logged_in
  #   flash[:alert] = "You need to be logged in to see or send a message"
  #   redirect_to(request.referrer || new_user_session_path)
  # end

end
