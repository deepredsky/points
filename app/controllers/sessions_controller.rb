class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  before_action :redirect_if_authenticated, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      if params[:user][:remember_me] == "1"
        cookies.signed.permanent[:user_id] = @user.id
      end
      redirect_to root_path, flash: { success: 'Logged in successfully' }
    else
      flash.now[:danger] = 'Invalid email/password combination'
      @user = User.new(email: params[:user][:email])
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete :user_id
    redirect_to new_session_path, flash: { success: 'Logged Out' }
  end
end
