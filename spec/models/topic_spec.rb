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
  describe Topic do
    ## Attributes
    it_behaves_like "it has attributes", Topic,
    {
      id: :integer,
      title: :string,
      user_id: :integer,
      created_at: :datetime,
      updated_at: :datetime
      } {}
    end
  end
