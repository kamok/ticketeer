FactoryGirl.define do
  sequence(:email) {|n| "user#{n}@example.com"}

  factory :user do
    name "Example project"
    email { generate(:email) }
    password "organic"

    factory :admin_user do
      admin true
    end
  end
end 