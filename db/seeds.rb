AdminUser.create!(email: "admin@user.com", password: 'password', password_confirmation: 'password', first_name: 'Admin', last_name: 'User')

puts 'admin user created'

@user = User.create!(email: "test@user.com", password: 'password', password_confirmation: 'password', first_name: 'Ron', last_name: 'Swanson')

puts 'test user created'

50.times do |post|
  Post.create!(title: "Test Title #{post}", available: 12, price: 1500, address: "123 West Any Street", location: "Any Location", user_id: @user.id )
end

puts '50 posts created'