class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :category, presence: true
  validates :location, presence: true
end
