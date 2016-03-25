class Bookmark < ActiveRecord::Base
  
  #------Relationships
  belongs_to :topic
end
