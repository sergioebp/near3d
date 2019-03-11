class Design < ApplicationRecord
  validates :name, length: { in: 4..30 }

  belongs_to :user
  has_one_attached :file

end
