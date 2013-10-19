FactoryGirl.define do
  factory :artist do
    name "Taylor Swift"
    description "She is a princess!"
    email "taylorswift@gmail.com"

    before :create do |artist|
      artist.image_file_name= "picture.jpg"
      artist.image_content_type = "image/jpeg"
      artist.image_file_size = 2588
      artist.image_updated_at = Time.zone.now
    end
  end
end
