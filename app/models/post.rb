class Post < ActiveRecord::Base
  
  mount_uploader :picture, PictureUploader
  attr_accessible :content, :title, :picture, :tag_list
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos
  attr_accessible :photos_attributes
  acts_as_taggable
end
