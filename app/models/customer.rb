class Customer < ApplicationRecord
	include SharedModelConcern
  belongs_to :organization
  has_many :sales
  has_many :repairs
end
