class SessionsController < ApplicationController
    def user_params
        params.require(:user).permit(:user_id, :email)
    end
    
    def new
        # default: render 'new' template
    end
    
    def create
        # Log in
        user = User.find_by_user_id(user_params[:user_id])
        if user.blank?
            flash[:warning] = "No account matching this User ID was found."
            redirect_to login_path
        else
            if user.email != user_params[:email]
                flash[:warning] = "The email provided does not match the email registered to this User ID."
                redirect_to login_path
            else
                p "Setting session token to #{user.session_token}"
                session[:session_token] = user.session_token
                redirect_to movies_path
            end
        end
    end
    
    def destroy
        # Log out
        session.delete(:session_token)
        redirect_to movies_path
    end
end
