class ArtistPolicy < ApplicationPolicy
  class Scope < Scope #the class scope and then the method resolve is actually the method that authorize all the instances of my clss Restaurant to be authorized
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    is_an_owner_or_an_admin?

  end

  def update?
    is_an_owner_or_an_admin?
  end

  def follow?
    user.present? && user != record
  end

  def unfollow?
    follow?
  end

  def is_an_owner_or_an_admin?

    user.id == record.id || user.admin
  end
end

