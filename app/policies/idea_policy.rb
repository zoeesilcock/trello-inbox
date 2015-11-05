class IdeaPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, idea)
    @user = user
    @idea = idea
  end

  def show?
    @user
  end

  def new?
    @user
  end

  def create?
    @user
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def owner?
    @idea.user == @user
  end
end
