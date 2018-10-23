regions_list = ['Eastern', 'Jordan River', 'Northern', 'Sevier River/Southern', 'Southeastern', 'Southwestern', 'Utah Lake', 'Weber River/Western']

regions_list.each do |name|
  Region.create!(name: name)
end

puts 'regions created'

divisions_list = [
[ 1, 'Daggett'],
[ 1, 'Duchesne'],
[ 1, 'Vernal'],
[ 1, 'Little Desert'],
[ 1, 'Uintah'],

[ 2, 'East Salt Lake'],
[ 2, 'Northwest Salt Lake'],
[ 2, 'Central Salt Lake'],
[ 2, 'Southwest Salt Lake'],

[ 3, 'Box Elder West'], 
[ 3, 'East Fork of Bear River'],
[ 3, 'Rich County'],
[ 3, 'Cache County'],
[ 3, 'Box Elder East'],

[ 4, 'Circleville'],
[ 4, 'Otter Creek'],
[ 4, 'Panguitch'],
[ 4, 'Richfield'],
[ 4, 'Salina'],
[ 4, 'Moroni'],
[ 4, 'Mt. Pleasant'],
[ 4, 'Fountain Green'],
[ 4, 'Ephraim'],
[ 4, 'Scipio'],
[ 4, 'Levan'],
[ 4, 'Pavant'],
[ 4, 'Delta'],
[ 4, 'Eureka'],
[ 4, 'Iron County West'],
[ 4, 'Milford'],
[ 4, 'Ceder City North'],
[ 4, 'Ceder City South'],
[ 4, 'Parowan'],
[ 4, 'Beaver'],
[ 4, 'St. George'],
[ 4, 'Rockville Kolob'],

[ 5, 'Grand Valley'],
[ 5, 'Moab'],
[ 5, 'Monticello'],
[ 5, 'West Tavatots Plateau'],
[ 5, 'Carbon'],
[ 5, 'Crescent Junction'],
[ 5, 'Emery / Castle Dale'],
[ 5, 'Fremont Junction'],
[ 5, 'Dark Canyon'],

[ 7, 'Payson'],
[ 7, 'Indianola'],
[ 7, 'Goshen'],
[ 7, 'Mona'],
[ 7, 'Ceder Valley'],
[ 7, 'Saratoga'],
[ 7, 'Heber'],
[ 7, 'Lehi'],
[ 7, 'Wallsburg'],
[ 7, 'Provo'],
[ 7, 'Midway'],
[ 7, 'Francis'], 

[ 8, 'Tooele - Grantsville'],
[ 8, 'Tooele - Erda'],
[ 8, 'Tooele - Lake Point'],
[ 8, 'Tooele West'],
[ 8, 'Ibopah'],
[ 8, 'West Desert'],
[ 8, 'Coleville'],
[ 8, 'Kamas'],
[ 8, 'Morgan'],
[ 8, 'Ogden'],
[ 8, 'Park City'],
[ 8, 'Rush Valley'],
[ 8, 'Davis County']]

divisions_list.each do |region_id, division|
  Division.create!(region_id: region_id, name: division)
end

puts 'divisions created'

AdminUser.create!(email: "admin@user.com", password: 'password', password_confirmation: 'password', first_name: 'Admin', last_name: 'User', roles: 'site_admin', phone: '4564564561')

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