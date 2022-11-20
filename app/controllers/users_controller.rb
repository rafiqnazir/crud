class UsersController < ApplicationController

    def create
        user = User.new(username: params[:username], email: params[:email],password: params[:password])
        if user.save
            render json: {user: user}
        else
            render json: {error: user.errors.full_messages}
        end

    end
end
