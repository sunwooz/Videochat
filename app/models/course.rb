class Course < ActiveRecord::Base
  attr_accessible :name, :language_id
  
  has_many :languages
  has_many :stories, :dependent => :destroy
  
  validates_presence_of :name, :language_id
  validates_uniqueness_of :name
end
