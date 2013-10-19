class Artist < ActiveRecord::Base

  validates :name, :description, :email, presence: true
  validates :email, uniqueness: true
end
