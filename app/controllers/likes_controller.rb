class LikesController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @likes = Like.where(user_id: @user.id)
        @lifehacks = Lifehack.all
        @mylist_rel = MylistRel.new
        @mylist_name = MylistName.new
        render :layout => 'layout/profile'
    end
    def create 
        lifehack = Lifehack.find(params[:lifehack_id])
        unless lifehack.liked?(current_user)
          lifehack.like(current_user)
        end
        redirect_to root_path
    end

    def destroy
        lifehack = Lifehack.find(params[:id])
        if lifehack.liked?(current_user)
          lifehack.unlike(current_user)
        end
        redirect_to root_path
    end
    def lifehack_params
        @lifehack = Lifehack.find(params[:lifehack_id])
    end
end
