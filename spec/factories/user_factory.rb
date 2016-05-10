FactoryGirl.define do
  factory :user do
    name "Example project"
    email "example@example.com"
    password "organic"
    password_confirmation "organic"

    factory :admin_user do
      admin true
    end
  end
end 