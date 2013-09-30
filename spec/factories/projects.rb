# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    user
    title "That super secret project"
    teaser "that teaser"
    description "this is the description and yeah what up fool"
    goal 1000000
  end
end