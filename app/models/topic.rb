class Topic < ApplicationRecord
    has_many :entries
    has_many :users, through: :entries
    accepts_nested_attributes_for :entries, allow_destroy: true
    validates :title, :presence => true, :uniqueness => true 
    validates :title_id, uniqueness: { scope: :user_id }
end
