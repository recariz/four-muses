class BusinessPolicy < ApplicationPolicy
  class Scope < Scope #the class scope and then the method resolve is actually the method that authorize all the instances of my clss Restaurant to be authorized
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def follow?
    user.present? && user != record
  end

  def unfollow?
    follow?
  end
end

