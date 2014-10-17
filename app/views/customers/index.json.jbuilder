json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :company, :address, :application, :description
  json.url customer_url(customer, format: :json)
end
