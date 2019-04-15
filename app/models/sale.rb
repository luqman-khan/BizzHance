class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  belongs_to :organization
  has_many :images

  after_save :add_to_customer_total
  before_update :update_customer_total
  before_destroy :update_customer_total

  validates :item_price, presence: true

  scope :generate_sale_index, -> (organization, customer){customer ? customer.sales : organization.sales}
  scope :generate_new_sale, -> (organization, customer) {customer ? customer.sales.new({item_price: 0}) : organization.sales.new({item_price: 0})}

  # This method adds to the total repairs done by the customer in the customer talbe just before creating a new repair
  def add_to_customer_total
  	current_total = self.customer.total_purchase
  	customer = self.customer
  	if current_total
  		customer.total_purchase += self.item_price
  	else
  		customer.total_purchase = self.item_price
  	end
  	customer.save
  end

  # This method runs right before updating a repair and subtracts the previous repair price from the customer table's total repair
  def update_customer_total
  	 current_total = self.customer.total_purchase
  	 sale = Sale.find(self.id)
  	 customer = self.customer
  	if current_total
  		customer.total_purchase -= sale.item_price
  	end
  	customer.save
  end

  def generate_sale_pdf
    return {pdf: "#{self.customer.name}_##{self.id}",
        template: "sales/invoice_pdf.html.erb",
        disable_smart_shrinking: false,
        title:  'Sales Invoice'}
  end
end
