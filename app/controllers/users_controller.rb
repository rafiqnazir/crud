class UsersController < ApplicationController

    def show
        user = User.find(params[:id])
        render json: {user: user}
    end

    def index
        users = User.page(params[:page]).order('created_at DESC')
        render json: users
    end

    def create
        user = User.new(username: params[:username], email: params[:email],password: params[:password])
        if user.save
            render json: {user: user}
        else
            render json: {error: user.errors.full_messages}
        end
    end

    def update
        @user = User.find(params[:id])
        @user.username = params[:username] if params[:username]
        @user.email = params[:email] if params[:email]
        @user.password = params[:password] if params[:password]
        if @user.save
            render json: {user: @user}
        else
            render json: {error: @user.errors.full_messages}
        end
    end
end
