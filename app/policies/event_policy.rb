class EventPolicy < ApplicationPolicy
  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
