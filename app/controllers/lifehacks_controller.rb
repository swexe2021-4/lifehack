class LifehacksController < ApplicationController
    
    def index
        @lifehacks = Lifehack.all
        @lifehacks = Kaminari.paginate_array(@lifehacks).page(params[:page]).per(5)
        @mylist_rel = MylistRel.new
        @mylist_name = MylistName.new
        @page_title = "ホーム"
    end
    
    def like_sort
        lifehacks = Lifehack.includes(:like_users).sort{|a,b| b.like_users.size <=> a.like_users.size}
        @lifehacks = Kaminari.paginate_array(lifehacks).page(params[:page]).per(5)
        @mylist_rel = MylistRel.new
        @mylist_name = MylistName.new
        @page_title = "いいね順"
        render 'index'
    end
    
    def follow_sort
        @lifehacks = Lifehack.where(user_id:[current_user.followings.ids])
        @lifehacks = Kaminari.paginate_array(@lifehacks).page(params[:page]).per(5)
        @mylist_rel = MylistRel.new
        @mylist_name = MylistName.new
        @page_title = "フォーロー中"
        render 'index'
    end
    
    def new
        @lifehack = Lifehack.new
    end
    def create
        
        if params[:lifehack][:file]
            @lifehack = Lifehack.new(user_id: current_user.id, title: params[:lifehack][:title], exp: params[:lifehack][:exp], file: params[:lifehack][:file].read,time: Time.current)
        else
            @lifehack = Lifehack.new(user_id: current_user.id, title: params[:lifehack][:title], exp: params[:lifehack][:exp],time: Time.current)
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
        @mylist_rel = MylistRel.new
        @mylist_name = MylistName.new
        @comments = @lifehack.comments
        if current_user
            @comment = current_user.comments.new
        end
    end
    
    def destroy
        lifehack = Lifehack.find(params[:id])
        lifehack.destroy
        redirect_to root_path
    end
    
    def get_image
        lifehack = Lifehack.find(params[:id]) #↓詳細は説明を後述する
        send_data lifehack.file, disposition: :inline, type: 'image/png'
    end
    def lifehack_params
        params.require(:post).permit(:lifehack_content)
    end
    def search
      @lifehacks = Lifehack.search(params[:keyword])
      @keyword = params[:keyword]
        @lifehacks = Kaminari.paginate_array(@lifehacks).page(params[:page]).per(5)
        @mylist_rel = MylistRel.new
        @mylist_name = MylistName.new
      render "index"
    end
end
