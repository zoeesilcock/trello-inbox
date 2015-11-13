class UserPolicy < ApplicationPolicy
  attr_reader :admin, :user

  def initialize(admin, user)
    @admin = admin
    @user = user
  end

  def index?
    @admin.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
