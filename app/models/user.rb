class User < ApplicationRecord
    has_many :lifehacks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :like_lifehacks, through: :likes, source: :lifehacks
end
