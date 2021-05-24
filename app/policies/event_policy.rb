class EventPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit?
    is_owner?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  def show?
    return true if record.pincode.blank? || is_owner? ||
      record.true_pincode?(cookies["event_#{record.id}_pincode"])

    false
  end

  private

  def is_owner?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
