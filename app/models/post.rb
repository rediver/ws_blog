class Post < ActiveRecord::Base
  
  mount_uploader :picture, PictureUploader
  attr_accessible :content, :title, :picture
  extend FriendlyId
  friendly_id :title, use: :slugged
  
end
