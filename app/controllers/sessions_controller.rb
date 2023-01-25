class SessionsController < ApplicationController
  # before_action :find_user, only: %i[discover show]
  # skip_before_action :check_login, only: [:new, :create, :destroy ]
  # skip_before_action :verify_authenticity_token

  def new; end

  def create
    user = UsersFacade.new(user_params).find_user
    if user
      reset_session
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}"
      redirect_to recipes_path(user.id)
    else
      flash[:error] = "Unknown username or password"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
