FactoryBot.define do
  sequence :email do |n|
    "test#{n}@email.com"
  end

  factory :user do
    first_name 'Ron'
    last_name 'Swanson'
    email { generate :email }
    password "password"
    password_confirmation "password"
    phone 5555555555
    roles "user"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password "password"
    password_confirmation "password"
    phone 5555555555
    roles "site_admin"
  end

  factory :non_authorized_user, class: "User" do
    first_name 'Non'
    last_name 'Authorized'
    email { generate :email }
    phone 5555555555
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end