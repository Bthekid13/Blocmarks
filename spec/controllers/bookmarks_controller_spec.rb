require 'rails_helper'
require 'factory_girl'


RSpec.describe BookmarksController, type: :controller do

  let(:my_topic) { create(:topic) }
  let(:my_bookmark) { create(:bookmark) }

  it {is_expected.to belong_to(:topic)}

  describe "attributes" do
    it "responds to a url" do
      expect(my_bookmark).to respond_to(:url)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end

    it "deletes the bookmark" do
      delete :destroy, topic_id: my_topic.id, id: my_bookmark.id
      count = Bookmark.where({id: my_bookmark.id}).size
      expect(count).to eq 0
    end

    it "redirects to topic show" do
      delete :destroy, topic_id: my_topic.id, id: my_bookmark.id

      expect(response).to redirect_to my_topic
    end
  end

end
