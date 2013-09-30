# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name "Rick"
  	last_name "Ross"
  	username "freeway"
  	 sequence(:email) {|n| "rick#{n}@gmail.com" }
    password "testtest"
  end
end
