class LifehacksController < ApplicationController
    
    def index
        @lifehacks = Lifehack.all
        lifehacks = Lifehack.includes(:like_users).sort{|a,b| b.like_users.size <=> a.like_users.size}
        @lifehacks = Kaminari.paginate_array(lifehacks).page(params[:page]).per(5)
        @mylist_rel = MylistRel.new
        @mylist_name = MylistName.new
    end
    def new
        @lifehack = Lifehack.new
    end
    def create
        
        if params[:lifehack][:file]
            @lifehack = Lifehack.new(user_id: current_user.id, title: params[:lifehack][:title], exp: params[:lifehack][:exp], file: params[:lifehack][:file].read)
        else
            @lifehack = Lifehack.new(user_id: current_user.id, title: params[:lifehack][:title], exp: params[:lifehack][:exp])
        end
        if @lifehack.save
        #TODO: ツイートが成功したことをユーザに知らせる
        redirect_to root_path
        else
        render 'new'
        end
    end
    def show
        @lifehack = Lifehack.find(params[:id])
        @user = User.find(@lifehack.user_id)
    end
    
    def destroy
        lifehack = Lifehack.find(params[:id])
        lifehack.destroy
        redirect_to :back
    end
    
    def get_image
        lifehack = Lifehack.find(params[:id]) #↓詳細は説明を後述する
        send_data lifehack.file, disposition: :inline, type: 'image/png'
    end

end
