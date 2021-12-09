class UsersController < ApplicationController
    before_action :set_user, only: [:likes]
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
    def likes
        @user = User.find_by(id: params[:id])
        likes = Like.where(user_id: @user.id).pluck(:lifehack_id)
        @like_lifehacks = lifehack.find(likes)
    end
    
  
    def set_user
        @user = User.find(params[:id])
    end
    def show
        
        @lifehacks = @q.result(distinct:true).paginate(page:params[:page]).where(user_id:@user.id)
    end
    def user_params_update
        params.require(:user).permit(:name, :intro)
    end
    
    def follows
        user = User.find(params[:id])
        @users = user.followings
    end
    
    def followers
        user = User.find(params[:id])
        @users = user.followers
    end
end