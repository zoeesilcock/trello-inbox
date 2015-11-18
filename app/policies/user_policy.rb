class UserPolicy < ApplicationPolicy
  attr_reader :admin, :user

  def initialize(admin, user)
    @admin = admin
    @user = user
  end

  def index?
    @admin.admin?
  end

  def update?
    @admin.admin?
  end
end
