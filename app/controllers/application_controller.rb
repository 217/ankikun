class ApplicationController < ActionController::Base
  # Omniauthでのログイン状況確認
  def current_omniuser
      @current_omniuser ||= Omniuser.find(session[:user_id]) if session[:user_id]
  end
  protect_from_forgery

  helper_method :current_omniuser
end
