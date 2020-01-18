class Entry < ApplicationRecord
    belongs_to :user 
    belongs_to :topic
    accepts_nested_attributes_for :topic, reject_if: :all_blank
    validates :date, presence: :true
    validates :content, presence: :true
    
    scope :searched, ->(search_term) { where("keyword LIKE ?", "%#{search_term}%") }
end
