class Bookmark < ActiveRecord::Base
  #Associations
  belongs_to :topic
  belongs_to :user
end
