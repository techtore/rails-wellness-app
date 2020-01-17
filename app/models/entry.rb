class Entry < ApplicationRecord
    belongs_to :user 
    belongs_to :topic
    accepts_nested_attributes_for :topic, reject_if: :all_blank
end
