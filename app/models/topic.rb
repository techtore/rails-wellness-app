class Topic < ApplicationRecord
    has_many :entries
    has_many :users, through: :entries
    accepts_nested_attributes_for :entries, allow_destroy: true
end
