class PostPolicy < ApplicationPolicy
  class Scope < Scope #the class scope and then the method resolve is actually the method that authorize all the instances of my clss Restaurant to be authorized
    def resolve
      scope.all #scope corresponds to the Restaurant class
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    is_an_artist?
  end

  def update?
    is_an_owner_or_an_admin?
  end

  def destroy?
    is_an_owner_or_an_admin?
  end

  private

  def is_an_artist?
    user.artist?
  end

  def is_an_owner_or_an_admin?
    user.id == record.user.id || user.admin
  end

end
