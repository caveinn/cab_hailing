class UsersController < ApplicationController
    def create
        puts params.inspect
        user = User.new(user_params)
        if user.save() 
            flash[:success] = "succesfully created user"
            redirect_to '/'
        else
            flash[:warning] =  "Invalid email or password"
            puts flash.inspect
            redirect_to '/users/new'
        end
    end

    private
     def user_params
        params.require(:user).permit(:email, :name, :phone, :password, :password_confirmation)
     end
end
