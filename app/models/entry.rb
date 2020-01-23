class Entry < ApplicationRecord
    belongs_to :user 
    belongs_to :topic
    accepts_nested_attributes_for :topic, reject_if: :all_blank
    validates :date, presence: :true
    validates :content, presence: :true
    scope :searched, ->(key_word) {where("keyword LIKE ?", "%#{key_word}%")}
    scope :mine, -> {where("user_id == ? ", "current_user.id")}
end
