class Artist < ActiveRecord::Base

  has_attached_file :avatar, 
                    :styles => { :medium => "920x327#", :thumb => "450x160#" }, 
                    default_url: "/images/:style/artist.png"

  validates :name, :description, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates_attachment :avatar, presence: true, content_type: { content_type: %r{image/*} }

   has_many :photos, dependent: :destroy                  
end
