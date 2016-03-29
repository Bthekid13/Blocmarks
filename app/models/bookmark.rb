class Bookmark < ActiveRecord::Base
  #Associations
  belongs_to :topic
end
