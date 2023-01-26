class WelcomeController < ApplicationController
  skip_before_action :check_login
  skip_before_action :verify_authenticity_token

  def index; end
end
