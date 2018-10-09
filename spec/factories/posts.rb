FactoryBot.define do
  factory :post do
    title "Rationale"
    available 12
    price 1500 
    address "123 West Any Street"
    location "Any Location" 
    purpose 0
    user
  end

  factory :second_post, class: "Post" do
    title "content"
    available 12
    price 1500 
    address "123 West Any Street"
    location "Any Location" 
    purpose 1
    user
  end
end