require "shoulda-matchers"
require "rails_helper"

RSpec.describe BookmarkPolicy, type: :policy do
  subject { described_class }
  let(:my_user) { create(:user, first_name: "my_user", last_name: "last_name1", email: "myuser@gmail.com") }
  let(:other_user) { create(:user, first_name: "other_user", last_name: "last_name2", email: "otheruser@gmail.com") }
  let(:my_topic) { create(:topic, user: my_user) }
  let(:my_bookmark) { create(:bookmark, topic: my_topic, user: my_user) }


  permissions :update?, :edit? do
    it "denies access if bookmark doensn't belong to the user" do
      expect(subject).not_to permit(other_user, my_bookmark)
    end

    it "grants access if a wiki belongs to a user" do
      expect(subject).to permit(my_user, my_bookmark)
    end
  end


  permissions :destroy? do
    it "denies access if Wiki doensn't belong to the user" do
      expect(subject).not_to permit(other_user, my_bookmark)
    end

    it "grants access if a wiki belongs to a user" do
      expect(subject).to permit(my_user, my_bookmark)
    end
  end
end
