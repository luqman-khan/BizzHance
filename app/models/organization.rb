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
	scope :get_next_repair_number, -> (org){(org.repairs.last && org.repairs.last.repair_number) ? (org.repairs.last.repair_number+1) : 0}
	scope :get_next_sale_number, -> (org){(org.sales.last && org.sales.last.sale_number) ? (org.sales.last.sale_number+1) : 0}

end
