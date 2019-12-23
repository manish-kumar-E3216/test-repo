require 'factory_girl_rails'
FactoryGirl.define do
  factory :user do
    fname 'John'
    lname  'Doe'
    email 'test@gmail.com'
    password 'password123'
    password_confirmation 'password123'
    activated false
  end

  factory :restaurant do
    id 3
    name "Test 1"
  end

  factory :foodlist do
    restaurant_id 1
    food_id 1
    cityinfo_id "1"
    foodcost 20
  end

  factory :foodcategory do
    id 3
    name "Test"
  end

  factory :food do
    id 3
    name "F:Test 2"
    foodcategory_id 1
  end

end