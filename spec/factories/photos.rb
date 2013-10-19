# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    artist
    description "Taylor Swift with fans!"

    before :create do |photo|
      photo.image_file_name= "picture.jpg"
      photo.image_content_type = "image/jpeg"
      photo.image_file_size = 2588
      photo.image_updated_at = Time.zone.now
    end
  end
end
