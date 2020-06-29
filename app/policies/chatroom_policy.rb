class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope #the class scope and then the method resolve is actually the method that authorize all the instances of my clss Restaurant to be authorized
    def resolve
      scope.involving(user)
    end
  end


  def show?
    record.sender == user || record.receiver == user
  end

  def create?
    user.present?
  end

end
