class Lifehack < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :like_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    
    
    has_many :mylist_rels, dependent: :destroy
    
    def like(user)
        likes.create(user_id: user.id)
    end

    def unlike(user)
        likes.find_by(user_id: user.id).destroy
    end
    def liked?(user) #いいね済みか調べる(true / false)
        like_users.include?(user)
    end
    def user
        return User.find_by(id: self.user_id)
    end
end
