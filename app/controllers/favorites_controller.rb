class FavoritesController < ApplicationController
  # before_action :find_user, only: %i[discover show]
  # skip_before_action :check_login, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def new; end

  def index
  end

  private

  def favorite_params
    params.permit()
  end
end
