class User < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
    has_many :lifehacks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :like_lifehacks, through: :likes, source: :lifehacks
=======
=======
    
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
    has_many :followers ,through: :passive_relationships, source: :following
    
    
    
    has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
    has_many :followings, through: :active_relationships, source: :follower
    
    
>>>>>>> user_follow
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    
    validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
    
    validates :name, {presence: true,uniqueness: { case_sensitive: false}}
    
    validates :gen,:age, {presence: :true}
    
    #validates :pass, presence: :true, format: { with: VALID_PASSWORD_REGEX ,message: 'は半角英数を両方含む必要があります'}
    def followed_by?(user)
        passive_relationships.find_by(following_id: user.id).present?
    end
    
>>>>>>> 289695f6f610ae6969f0f91e0a3049fe47e22255
end
