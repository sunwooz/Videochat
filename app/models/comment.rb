class Comment < ActiveRecord::Base
  attr_accessible :body, :name
  
  belongs_to :post
  
  validates_presence_of :name, :body
  validates_length_of :body, :within => 1..200
end
