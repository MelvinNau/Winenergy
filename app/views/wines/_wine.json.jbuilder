json.extract! wine, :id, :name, :domain, :label, :variety, :designation, :alcohol, :years, :vendors_id, :price, :created_at, :updated_at
json.url wine_url(wine, format: :json)
