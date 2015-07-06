class LogePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a Loge
  end

  # def create?
  #   false  # No one should be able to create a loge but the create route does not exist so far
  # end

  # def update?
  #   false  # No one should be able to update a loge but the create route does not exist so far
  # # end

  # def destroy?
  #   false  # No one should be able to update a loge but the create route does not exist so far
  # # end

end
