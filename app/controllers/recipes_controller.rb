class RecipesController < ApplicationController
  # before_action :find_user, only: %i[discover show]
  # skip_before_action :check_login, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def index
    if params[:country]
      @recipes = RecipesFacade.new
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end