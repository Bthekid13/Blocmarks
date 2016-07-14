require 'rails_helper'

RSpec.describe IncomingController, type: :controller do

  let(:my_user) {User.create!(first_name: "joe", last_name: "Smith", email: "bobo@gmail.com", password: "bobafett")}
  let(:my_topic) { create(:topic, user: my_user) }

  describe "POST #create" do

    it "@user == my_user" do
      new_url = "new_url.test.com"
      post :create, { sender: my_user.email, subject: my_topic.title, "body-plain" => new_url }
      expect(assigns(:user)).to eq my_user
    end

    it "@topic == my_topic" do
      new_url = "new_url.test.com"
      post :create, { sender: my_user.email, subject: my_topic.title, "body-plain" => new_url }
      expect(assigns(:topic)).to eq my_topic
    end

    it "new topic increases number of topics by 1" do
      new_url = "new_url.test.com"
      new_topic = "#New Topic"
      expect{ post :create, { sender: my_user.email, subject: new_topic, "body-plain" => new_url }}.to change(Topic, :count).by(1)
    end

    it "new bookmark increases number of bookmarks by 1" do
      new_url = "new_url.test.com"
      expect{ post :create, { sender: my_user.email, subject: my_topic.title, "body-plain" => new_url }}.to change(Bookmark, :count).by(1)
    end

    it "new bookmark with new user increases number of bookmarks by 1" do
      new_url = "new_url.test.com"
      new_email = "new_user@test.com"
      expect{ post :create, { sender: new_email, subject: my_topic.title, "body-plain" => new_url }}.to change(Bookmark, :count).by(1)
    end
  end

end
