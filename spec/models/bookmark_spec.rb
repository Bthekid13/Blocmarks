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

require 'support/model_support'

describe Bookmark do
  ## Attributes
  it_behaves_like "it has attributes", Bookmark,
  {
    id: :integer,
    url: :string,
    topic_id: :integer,
    user_id: :integer,
    slug: :string,
    created_at: :datetime,
    updated_at: :datetime
  } {}

  ## Active Record Associations
  it { should belong_to(:topic) }
end
