class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_user
  helper_method :user_signed_in?
  before_action :authenticate_user

  def current_user
    @current_user ||= login_user
  end

  def user_signed_in?
    !current_user.nil?
  end

  def authenticate_user
    redirect_to new_session_path, flash: {danger: 'You must be signed in'} if current_user.nil?
  end

  def redirect_if_authenticated
    redirect_to root_path, flash: { info: 'You are already logged in.'} if user_signed_in?
  end

  private

  def login_user
    user_id = session[:user_id] || cookies.signed[:user_id]
    user_id && User.find_by(id: user_id)
  end
end
