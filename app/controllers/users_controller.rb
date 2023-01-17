class UsersController < ApplicationController
  # before_action :find_user, only: %i[discover show]
  # skip_before_action :check_login, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    new_user = UsersFacade.new(user_params).create_user
    # require'pry';binding.pry
    if new_user
      reset_session
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.email}"
      redirect_to recipes_path(new_user)
    else
      redirect_to register_path
      flash[:alert] = UsersFacade.new(user_params).post_message
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
