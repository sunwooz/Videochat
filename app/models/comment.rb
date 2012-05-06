class Comment < ActiveRecord::Base
  attr_accessible :body, :name, :post_id
  
  belongs_to :post
  
  validates_presence_of :name, :body
end
