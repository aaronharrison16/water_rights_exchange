FactoryBot.define do
  factory :post do
    title "Rationale"
    available 12
    price 1500 
    address "123 West Any Street"
    purpose 0
    water_type 0
    division_id 3
    region_id 1
    user
  end

  factory :second_post, class: "Post" do
    title "content"
    available 12
    price 1500 
    address "123 West Any Street"
    purpose 1
    water_type 1
    division_id 3
    region_id 1
    user
  end
end