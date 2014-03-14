class UserPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present? && user.role?(:admin)
  end

  def udpate?
    create?
  end

  def show?
    user.present? && scope.where(id: record.id).exists?
  end
end