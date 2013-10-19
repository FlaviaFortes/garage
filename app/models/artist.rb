class Artist < ActiveRecord::Base

  validates :name, :description, :email, presence: true
  validates :email, uniqueness: true

  has_attached_file :avatar, :styles => { :medium => "920x327#", :thumb => "450x160#" }, default_url: "/images/:style/artist.png"
end
