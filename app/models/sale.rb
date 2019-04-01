class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_many :images
end
