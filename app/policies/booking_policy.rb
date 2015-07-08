class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user || record.service.user == user # Only the user or the concerned expert can see the booking
  end

  def create?
    true # Any logged in user can create a booking
  end

  def update?
    record.service.user == user # Only the concerned expert can update the booking
  end

  def accept?
    record.user == user # Only the concerned member can validate
  end

  def refuse?
    record.user == user # Only the concerned member can validate
  end

  def mission_done?
    record.service.user == user # Only the concerned expert can update the booking
  end


  # def destroy?
  #   false  # No one should be able to update a loge but the create route does not exist so far
  # # end
end
