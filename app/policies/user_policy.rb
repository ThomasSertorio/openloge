class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a User Profile
  end

  # def create?
  #   false  # No one should be able to create a loge but the create route does not exist so far
  # end

  def edit?
    record == user # Only the user can edit his profile
  end

  def update?
    record == user # Only the user can update his profile
  end

  # def destroy?
  #   false  # No one should be able to update a loge but the create route does not exist so far
  # # end
end
