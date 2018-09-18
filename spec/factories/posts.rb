FactoryBot.define do
  factory :post do
    title "Test Title"
    available 12
    price 1500 
    address "123 West Any Street"
    location "Any Location" 
    user
  end
end