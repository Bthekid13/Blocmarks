class Topic < ActiveRecord::Base

  #------Relationships
  belongs_to :user
  has_many :bookmarks
end
