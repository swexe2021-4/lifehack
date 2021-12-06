class MylistRelsController < ApplicationController
  def index
    @mylists = MylistRel.where(mylist_name_id: params[:mylist_name_id])
    @lifehacks = Lifehack.all
    @mylist_name = MylistName.find(params[:mylist_name_id])
  end

  def create
    mylist = MylistName.find(params[:mylist_rel][:mylist_name_id])
    lifehack = Lifehack.find(params[:lifehack_id])
    unless mylist.mylisted?(lifehack)
      @mylist_rel = MylistRel.create(mylist_name_id: params[:mylist_rel][:mylist_name_id],lifehack_id: params[:lifehack_id])
      @mylist_rel.save
    else
      flash[:alert] = "すでに追加済です。"
    end
    redirect_to lifehacks_path
  end
  
  def destroy
    mylist = MylistRel.find_by(mylist_name_id: params[:mylist_name_id],lifehack_id: params[:id])
    mylist.destroy
    redirect_to mylist_name_mylist_rels_index_path(params[:mylist_name_id])
  end
  
end
