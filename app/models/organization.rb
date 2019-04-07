class Organization < ApplicationRecord
	include SharedModelConcern
	has_many :users
	has_many :customers
	has_many :sales
	has_many :repairs
	has_many :images

	scope :find_customer_by_id, -> (organization, customer_id) {customer_id ? organization.customers.find(customer_id) : organization.customers.new}
	scope :get_all_organization_name, -> (){all.map{|org| org.name if org.authorize}}
	scope :capitalize_names, -> (){ col = all.map{|m| [m.capitalize_name,m.id]}}

end
