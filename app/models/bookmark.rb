# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  url        :string
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  slug       :string
#
# Indexes
#
#  index_bookmarks_on_slug      (slug)
#  index_bookmarks_on_topic_id  (topic_id)
#  index_bookmarks_on_user_id   (user_id)
#

class Bookmark < ActiveRecord::Base
  #Associations
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :url, :url => true
  validates :topic, presence: true

end
