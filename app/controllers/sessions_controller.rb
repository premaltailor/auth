class SessionsController < ApplicationController
    def new
    end

    def create
        entered_email = params["email"]
        entered_password = params["password"]

         #checking the email
     @user = User.find_by({email: entered_email})

        if @user # yes, email matches
          # check the password
            if BCrypt::Password.new(@user.password) == entered_password
            session["user_id"] = @user_id
            flash[:notice] == "Welcome!"
            redirect_to "/companies"
         else 
            # password doesn't match
            flash[:notice] = "Password is incorrect"
            redirect_to "/sessions/new"
        end
        else 
            flash[:notice] = "No user with that email address"
             redirect_to "/sessions/new"
        end
    end


    def destroy
        session["user_id"] = nil
     flash[:notice] = "you have been logged out"
        redirect_to "/sessions.new"
    end

end