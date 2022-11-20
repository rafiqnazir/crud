class SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            render json: {user: user}
        else
            render json: {error: "Invalid Credentials"}
        end
    end

    def delete
        session[:user_id] = nil
        render json: {message: 'User Logged Out...'}

    end

end
