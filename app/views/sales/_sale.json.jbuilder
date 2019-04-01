json.extract! sale, :id, :item_sold, :item_price, :note, :date_of_sale, :user_id, :customer_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
