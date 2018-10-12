AdminUser.create!(email: "admin@user.com", password: 'password', password_confirmation: 'password', first_name: 'Admin', last_name: 'User', roles: 'site_admin')

puts 'admin user created'

@user_2 = User.create!(email: "aaronharrison@waterrightexchange.com", password: 'password', password_confirmation: 'password', first_name: 'Aaron', last_name: 'Harrison', phone: '3333333333')

@user = User.create!(email: "test@user.com", password: 'password', password_confirmation: 'password', first_name: 'Ron', last_name: 'Swanson', phone: '5555555555')

puts '2 test users created'

50.times do |post|
  Post.create!(title: "Test Title #{post}", available: 12, price: 1500, address: "123 West Any Street", location: "Any Location", user_id: @user.id, purpose: 'buy', water_type: 'acre_foot' )
end

50.times do |post|
  Post.create!(title: "Test Title User 2 #{post}", available: 12, price: 1500, address: "123 West Any Street", location: "Any Location", user_id: @user_2.id, purpose: 'buy', water_type: 'share' )
end

puts '100 posts created'