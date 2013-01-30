class Blog < ActiveRecord::Base
  
  mount_uploader :picture, PictureUploader
  attr_accessible :content, :title, :picture
  
end
