class Repair < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  belongs_to :organization
  has_many :images

  after_save :add_to_cutomer_total
  before_update :update_customer_total


  scope :generate_repair_index, -> (organization, customer){customer ? customer.repairs : organization.repairs}
  scope :generate_new_repair, -> (organization, customer){ customer ? customer.repairs.new : organization.repairs.new}

  # This method adds to the total repairs done by the customer in the customer talbe just before creating a new repair
  def add_to_customer_total
  	current_total = self.customer.total_repair
  	customer = self.customer
  	if current_total
  		customer.total_repair += self.total_charge
  	else
  		customer.total_repair = self.total_charge
  	end
  	# puts "----------------------------------------------------luqman#{customer.total_repair}"
  	customer.save
  end

  # This method runs right before updating a repair and subtracts the previous repair price from the customer table's total repair
  def update_customer_total
  	 current_total = self.customer.total_repair
  	 repair = Repair.find(self.id)
  	 customer = self.customer
  	if current_total
  		customer.total_repair -= repair.total_charge
  	end
  	customer.save
  end

end
