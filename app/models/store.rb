class Store < ApplicationRecord
    has_many :Userstores, dependent: :destroy
    has_many :users, through: :Userstores
    has_many :printers, dependent: :destroy
end
