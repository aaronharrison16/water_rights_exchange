FactoryBot.define do
  sequence :email do |n|
    'test#{n}@email.com'
  end

  sequence :admin_email do |n|
    'admin.test#{n}@email.com'
  end

  factory :user do
    first_name 'Ron'
    last_name 'Swanson'
    email { generate :email }
    password "password"
    password_confirmation "password"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :admin_email }
    password "password"
    password_confirmation "password"
  end
end