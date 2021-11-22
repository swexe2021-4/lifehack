class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    
    validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
    
    validates :name, {presence: true,uniqueness: { case_sensitive: false}}
    
    validates :gen,:age, {presence: :true}
    
    #validates :pass, presence: :true, format: { with: VALID_PASSWORD_REGEX ,message: 'は半角英数を両方含む必要があります'}
    
    
    has_many :lifehacks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :like_lifehacks, through: :likes, source: :lifehacks
end
