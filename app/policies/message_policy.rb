class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Any logged in user can see a message
  end

  def create?
    true # Any logged in user can create a message
  end

end
