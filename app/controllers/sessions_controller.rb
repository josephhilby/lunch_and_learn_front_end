class UsersController < ApplicationController
  before_action :find_user, only: %i[discover show]
  skip_before_action :check_login, only: [:new, :create, :destroy ]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.admin?
        flash[:success] = "Welcome, Administrator #{user.email}"
      elsif user.default?
        reset_session
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.email}"
        redirect_to user_path(user)
      end
    else
      flash[:error] = "Unknown username or password"
      render :login_form
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
