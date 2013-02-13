class Post < ActiveRecord::Base
  
  mount_uploader :picture, PictureUploader
  attr_accessible :content, :title, :picture
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :photos
  accepts_nested_attributes_for :photos
  attr_accessible :photos_attributes
end
