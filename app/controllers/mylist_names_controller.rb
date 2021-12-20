class MylistNamesController < ApplicationController
  def index
    @mylist_names = MylistName.where(user_id: params[:user_id])
    @mylist_name = MylistName.new
    @user = User.find(params[:user_id])
    @page_title = "マイリスト一覧"
    
    render :layout => 'layout/profile'
  end

  def create
    mylistname = MylistName.create(user_id: current_user.id,
    name: params[:mylist_name][:name])
    if mylistname.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    mylist = MylistName.find(params[:id])
    mylist.destroy
    redirect_to user_mylist_names_index_path(current_user.id)
  end
end
