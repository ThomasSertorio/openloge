class ServicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def destroy?
  #   false  # No one should be able to update a loge but the create route does not exist so far
  # # end
end
