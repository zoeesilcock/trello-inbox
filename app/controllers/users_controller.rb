class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize User
    @users = User.all
  end

  def update
    user = User.find params[:id]
    authorize user

    render nothing: true, status: :ok if user.update_attributes user_parameters
  end

  private

  def user_parameters
    params.require(:user).permit(:creator, :admin)
  end
end
