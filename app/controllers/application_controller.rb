class ApplicationController < ActionController::Base
    protect_from_forgery

    helper_method :current_omniuser

    #Omniauthでのログイン状況確認
    private
    def current_omniuser
        @current_omniuser ||= Omniuser.find(session[:user_id]) if session[:user_id]
    end
end
