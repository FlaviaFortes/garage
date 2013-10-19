FactoryGirl.define do
  factory :artist do
    name "Taylor Swift"
    description "I'm a beatiful princess and I love do sing about love!"
    email "taylorswift@gmail.com"

    before :create do |artist|
      artist.avatar_file_name= "picture.jpg"
      artist.avatar_content_type = "image/jpeg"
      artist.avatar_file_size = 2588
      artist.avatar_updated_at = Time.zone.now
    end
  end
end
