class ListPolicy < ApplicationPolicy

  def index
    user.present? && (record.user == user || user.role?(:admin))
    #scope.where(user.present? && (record.user == user || user.role?(:admin)))
  end

  def show
    user.present? && (record.user == user || user.role?(:admin))
  end

  def update?
    user.present? && (record.user == user || user.role?(:admin))
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end