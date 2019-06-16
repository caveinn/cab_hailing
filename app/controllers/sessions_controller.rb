class SessionsController < ApplicationController
    def create
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
            session[:user_id] = user.id
            flash[:success] = "succesfully loged in"
            redirect_to "/"
        else
            flash[:warning] = "wrong email or password"
            redirect_to "/login"

        end
    end

    private
        def user_params
            params.require(:user).permit!
        end
end
