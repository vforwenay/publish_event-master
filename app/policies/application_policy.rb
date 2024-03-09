class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    new?
  end

  def new?
    true
  end

  def update?
    new?
  end

  def edit?
   new?
  end

  def destroy?
    new?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      byebug
      scope.all
    end
  end
end
