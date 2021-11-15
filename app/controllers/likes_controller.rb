class LikesController < ApplicationController
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
end
