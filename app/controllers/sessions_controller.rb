class SessionsController < ApplicationController
  before_action :skip_authorization

  def new
    redirect_to '/auth/google_oauth2'
  end

  def create
    auth = request.env['omniauth.auth']
    user = find_user(auth) || User.create_with_omniauth(auth)

    reset_session
    session[:user_id] = user.id

    redirect_to root_url, notice: 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure
    redirect_to root_url, alert:
      "Authentication error: #{params[:message].humanize}"
  end

  private

  def find_user(auth)
    User.where(
      provider: auth['provider'],
      uid: auth['uid'].to_s
    ).first
  end
end
