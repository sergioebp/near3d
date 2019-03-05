class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         enum role: %i[client vendor admin guest]

  has_many :designs, dependent: :destroy
  has_many :suggestions, dependent: :destroy
end
