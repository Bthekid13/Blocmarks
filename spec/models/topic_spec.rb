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

require 'rails_helper'

RSpec.describe Topic, type: :model do

  ## Associations

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:bookmarks) }
  end

  ## Attributes

  describe "attributes" do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:title).of_type(:string) }
  end
end
