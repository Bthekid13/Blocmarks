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

require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  ## Associations

  describe "associations" do
    it { should belong_to(:topic) }
    it { should belong_to(:user) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  ## Attributes

  describe "attributes" do
    it { should have_db_column(:slug).of_type(:string) }
    it { should have_db_column(:url).of_type(:string) }
  end
end
