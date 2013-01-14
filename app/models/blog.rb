class Blog < ActiveRecord::Base
  
  attr_accessible :content, :title, :name, :email, :password, :password_confirmation, :remember_me

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false

end
