FactoryGirl.define do
  factory :body_mass do
    user_id 1
    mass Faker::Number.decimal(2)
    height Faker::Number.decimal(2)
    category "MyString"
    imc 1.5
  end
end
