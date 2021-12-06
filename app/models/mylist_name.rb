class MylistName < ApplicationRecord
    has_many :mylist_rels, dependent: :destroy
    belongs_to :user
    
    has_many :lifehack_mylist, through: :mylist_rels, source: :lifehack
    
    def mylisted?(lifehack)
        lifehack_mylist.include?(lifehack)
    end
end
