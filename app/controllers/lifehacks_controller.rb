class LifehacksController < ApplicationController
<<<<<<< HEAD
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
=======
    
>>>>>>> 8bdb194a058344a7715728159c4d004a4a9ebc91
end
