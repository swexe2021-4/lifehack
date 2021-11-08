class LifehacksController < ApplicationController
    def index
        @lifehacks = Lifehack.all
    end
    def new
        @lifehack = Lifehack.new
    end
    def create
        @lifehack = Lifehack.new(title: params[:lifehack][:title], exp: params[:lifehack][:exp], file:[:lifehack][:file])
        @lifehack.save
    end
end
