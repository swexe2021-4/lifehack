class UsersController < ApplicationController
    def index
        @user = User.all
    end
    
    def new 
        @user = User.new
    end
    
    def create
        @user = User.new(
            email: params[:user][:email],
            pass: params[:user][:pass],
            name: params[:user][:name],
            gen: params[:user][:gen],
            age: params[:user][:age])
            
        if @user.valid?
            @user.pass = BCrypt::Password.create(params[:user][:pass])
            @user.save
        redirect_to root_path
        else
        render 'new'
        end
    end
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to '/users'
    end
    
end
