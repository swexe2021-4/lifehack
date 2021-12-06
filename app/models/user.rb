class User < ApplicationRecord
    has_many :lifehacks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :like_lifehacks, through: :likes, source: :lifehacks
    
    has_many :mylist_names, dependent: :destroy
    
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
    has_many :followers ,through: :passive_relationships, source: :following
    
    
    has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
    has_many :followings, through: :active_relationships, source: :follower
    
    

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    
    validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
    
    validates :name, {presence: true,uniqueness: { case_sensitive: false}}
    
    validates :gen,:age, {presence: :true}
    
    #------------------------------------------------------------------------------------------
    
    #今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)が
    #フォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    def followed_by?(user)
        passive_relationships.find_by(following_id: user.id).present?
    end
    
    
    has_many :lifehacks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :like_lifehacks, through: :likes, source: :lifehacks
    validates :intro, presence: false, length: { maximum: 50 }
    def liked_by?(lifehack_id)
        likes.where(lifehack_id: lifehack_id).exists?
    end
    def lifehacks
        return Lifehack.where(user_id: self.id)
    end

end
