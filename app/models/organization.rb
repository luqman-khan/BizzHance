class Organization < ApplicationRecord
	has_many :users
	has_many :customers
	has_many :sales
	has_many :repairs
	has_many :images

	scope :find_customer_by_id, -> (organization, customer_id) {customer_id ? organization.customers.find(customer_id) : organization.customers.new}
end
