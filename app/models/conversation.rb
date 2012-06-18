class Conversation < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :story
end
