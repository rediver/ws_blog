class Photo < ActiveRecord::Base
  mount_uploader :url, PictureUploader
  attr_accessible :url
  belongs_to :post
end
