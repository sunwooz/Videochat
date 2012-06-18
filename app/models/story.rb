class Story < ActiveRecord::Base
  attr_accessible :primary_language_id, :name, :lesson
  
  belongs_to :course
  has_many :conversations
end
