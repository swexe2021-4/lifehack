class ApplicationController < ActionController::Base
    private
    def current_user
        if session[:login_email]
            User.find_by(email: session[:login_email])
        end
    end
    helper_method :current_user
end
