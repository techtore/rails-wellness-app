class Topic < ApplicationRecord
    has_many :users
    has_many :users, through: :entries
end
