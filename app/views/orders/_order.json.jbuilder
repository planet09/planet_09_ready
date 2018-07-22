json.extract! order, :id, :o_id, :del_addr, :detail_addr, :post_code, :total_pay, :del_pay, :or_time, :pay_time, :amount, :invoice_code, :created_at, :updated_at
json.url order_url(order, format: :json)
