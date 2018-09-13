json.extract! post, :id, :title, :number_availble, :address, :description, :created_at, :updated_at
json.url post_url(post, format: :json)
