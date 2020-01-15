class Topic < ApplicationRecord
    has_many :users
    has_many :users, through: :entries
    accepts_nested_attributes_for :entries
end
