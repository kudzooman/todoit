class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.present? && (record.user == user || user.role?(:admin))
  end

  def show?
    #user.present? && (record.user == user || user.role?(:admin))
    #scope.where(:id => record.id).exists?
    #scope.where(user.present? && (record.user == user || user.role?(:admin)))
    #user.present? && record.user == user
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
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

  def scope
    # Pundit.policy_scope!(user, record.class)
    record.class
  end
end

