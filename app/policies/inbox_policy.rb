class InboxPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, inbox)
    @user = user
    @inbox = inbox
  end

  def show?
    @user
  end

  def new?
    creator?
  end

  def create?
    creator?
  end

  def edit?
    creator? && owner?
  end

  def update?
    creator? && owner?
  end

  def destroy?
    creator? && owner?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def creator?
    @user.creator?
  end

  def owner?
    @user.owns @inbox
  end
end
