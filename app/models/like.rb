# == Schema Information
#
# Table name: likes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  bookmark_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_likes_on_bookmark_id  (bookmark_id)
#  index_likes_on_user_id      (user_id)
#

class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark
end
