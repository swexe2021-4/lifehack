class LifehacksController < ApplicationController
    
    def index
        @lifehacks = Lifehack.all
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
    end
    def get_image
        lifehack = Lifehack.find(params[:id]) #↓詳細は説明を後述する
        send_data lifehack.file, disposition: :inline, type: 'image/png'
    end
end
