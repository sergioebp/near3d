class Store < ApplicationRecord
    has_many :Userstores, dependent: :destroy
    has_many :users, through: :Userstores
end
