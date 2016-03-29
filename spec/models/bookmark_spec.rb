require 'support/model_support'

describe Bookmark do
  ## Attributes
  it_behaves_like "it has attributes", Bookmark,
  {
    id: :integer,
    url: :string,
    topic_id: :integer,
    created_at: :datetime,
    updated_at: :datetime
  } {}

  ## Active Record Associations
  it { should belong_to(:topic) }
end
