class Audio < ActiveRecord::Base

  validates :url, presence: true

  belongs_to :artist
end
