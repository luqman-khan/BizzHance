class Organization < ApplicationRecord
	has_many :users
	has_many :customers
	has_many :sales
	has_many :repairs
	has_many :images
end
