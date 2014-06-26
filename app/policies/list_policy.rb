class ListPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:admin)
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def index
    user.present? 
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