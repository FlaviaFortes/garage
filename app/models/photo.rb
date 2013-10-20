class Photo < ActiveRecord::Base

  has_attached_file :image,
                    :styles => { :medium => "920x327#", :thumb => "450x160#" },
                    default_url: "/images/:style/photo.png"

  validates_attachment :image, content_type: { content_type: %r{image/*} }

  belongs_to :artist
end
