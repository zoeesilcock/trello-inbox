class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :find_inboxes, if: :current_user
  after_action :verify_authorized, except: :index
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :user_is_creator?
  helper_method :user_is_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue StandardError
    nil
  end

  def user_signed_in?
    return true if current_user
  end

  def user_is_creator?
    current_user.creator?
  end

  def user_is_admin?
    current_user.admin?
  end

  private

  def find_inboxes
    @inboxes = Inbox.all
  end

  def authenticate_user!
    redirect_to root_url,
      alert: I18n.t('authentication.please_sign_in') unless current_user
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t("#{policy_name}.#{exception.query}"),
      { scope: 'pundit', default: :default }

    redirect_to(request.referrer || root_path)
  end
end
