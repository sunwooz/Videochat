class Story < ActiveRecord::Base
  attr_accessible :primary_language_id, :name, :lesson, :category_id
  
  belongs_to :course
  has_many :conversations
  has_many :categories
end
