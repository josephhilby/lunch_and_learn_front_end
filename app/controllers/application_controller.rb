class ApplicationController < ActionController::Base
  before_action :check_login
  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id] && session[:api_key]
      @current_user_id ||= session[:user_id]
      @current_user_api_key ||= session[:api_key]
    end
  end

  def logged_in?
    current_user != nil
  end

  def check_login
    if !logged_in?
      flash[:error] = "You must be logged in to view this content"
      redirect_to '/'
    end
  end
end
