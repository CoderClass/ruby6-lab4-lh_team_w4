class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def signed_in?
    current_user
  end

  def current_user
    return @current_user if @current_user

    if session[:username]

      @current_user = session[:username]
    end
  end
end
