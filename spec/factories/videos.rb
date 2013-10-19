# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    url "www.youtube.com/watch?v=XPBwXKgDTdE"
    artist
  end
end
