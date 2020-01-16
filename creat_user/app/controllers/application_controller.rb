class ApplicationController < ActionController::Base
    private
    def confirm_login
        unless session[:user_id]
            flash[:notice] = "Please log in"
            redirect_to access_login_path
        end
    end

end
