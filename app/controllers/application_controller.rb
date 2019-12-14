class ApplicationController < ActionController::Base

    helper_method :current_user, :signed_in?

    private

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def signed_in?
        !!current_user
    end

    def require_signed_in
        redirect_to new_session_url unless signed_in?
    end

end
