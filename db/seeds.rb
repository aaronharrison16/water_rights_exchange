50.times do |post|
  Post.create(title: "Test Title #{post}", available: 12, price: 1500, address: "123 West Any Street", location: "Any Location")
end

puts '50 posts created'

