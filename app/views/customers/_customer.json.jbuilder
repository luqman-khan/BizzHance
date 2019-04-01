json.extract! customer, :id, :name, :phone, :total_purchase, :total_repair, :organization_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
