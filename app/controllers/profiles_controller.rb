class ProfilesController < ApplicationController
    def show
       
        @user = User.find_by(id: params[:id])
        @lifehacks = Lifehack.where(user_id: params[:id]) 
        @mylist_rel = MylistRel.new
        @mylist_name = MylistName.new
        @page_title = "#{@user.name}の投稿"
        render :layout => 'layout/profile'
        
    end
    def edit
        @user = User.find(current_user.id)
        @page_title = "マイページ編集"
        
    end
    
    def update
        @user = User.find(current_user.id)
        if @user.update(user_params)
            redirect_to profile_path, success: t('defaults.message.edited', item: User.model_name.human)
        else
            flash.now['danger'] = t('defaults.message.not_edited', item: User.model_name.human)
            render :edit
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name,:intro,:lifehack,:icon)
    end
end
