class WelcomeController < ApplicationController
  # skip_before_action :check_login, only: [:index]
  skip_before_action :verify_authenticity_token

  def index; end
end
