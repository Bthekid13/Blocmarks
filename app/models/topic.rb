# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_user_id  (user_id)
#

class Topic < ActiveRecord::Base

  #------Relationships
  belongs_to :user
  has_many :bookmarks
end
