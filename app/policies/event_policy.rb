class EventPolicy < ApplicationPolicy
  def destroy?
    record.user == user
  end

  def show?
    record.pincode.blank? || user == record.user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
