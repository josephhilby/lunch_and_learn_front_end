class WelcomeController < ApplicationController
  before_action :current_user
  skip_before_action :check_login
  skip_before_action :verify_authenticity_token

  def index; end
end
