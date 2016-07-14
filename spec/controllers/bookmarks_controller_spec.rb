require 'rails_helper'

describe BookmarksController do

  before :example do
    @user = create :user
    @my_topic = create(:topic, user: @user)
    @my_bookmark = create(:bookmark, topic: @my_topic, user: @user)
    sign_in @user
  end
  
  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: @my_topic.id, id: @my_bookmark.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: @my_topic.id, id: @my_bookmark.id
      expect(response).to render_template :show
    end

    it "assigns my_bookmark to @bookmark" do
      get :show, topic_id: @my_topic.id, id: @my_bookmark.id
      expect(assigns(:bookmark)).to eq(@my_bookmark)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: @my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: @my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @bookmark" do
      get :new, topic_id: @my_topic.id
      expect(assigns(:bookmark)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the number of Bookmark by 1" do
      expect{ post :create, topic_id: @my_topic.id, bookmark: { url: "new_url@example.com" }}.to change(Bookmark, :count).by(1)
    end

    it "assigns the new bookmark to @bookmark" do
      post :create, topic_id: @my_topic.id, bookmark: { url: "new_url@example.com" }
      expect(assigns(:bookmark)).to eq Bookmark.last
    end

    it "redirects to the new bookmark" do
      post :create, topic_id: @my_topic.id, bookmark: { url: "new_url@example.com" }
      expect(response).to redirect_to [@my_topic, Bookmark.last]
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: @my_topic.id, id: @my_bookmark.id
      expect(response).to have_http_status(:success)
    end

    it "renders #edit view" do
      get :edit, topic_id: @my_topic.id, id: @my_bookmark.id
      expect(response).to render_template :edit
    end

    it "assigns bookmark to be updatded to @bookmark" do
      get :edit, topic_id: @my_topic.id, id: @my_bookmark.id
      bookmark_instance = assigns(:bookmark)

      expect(bookmark_instance.id).to eq @my_bookmark.id
      expect(bookmark_instance.url).to eq @my_bookmark.url
    end
  end

  describe "PUT #update" do
    it "updates topic with expected attributes" do

      put :update, topic_id: @my_topic.id, id: @my_bookmark.id
      updated_bookmark = assigns(:bookmark)
      expect(updated_bookmark.id).to eq @my_bookmark.id
    end

    it "redirects to the updated bookmark" do

      put :update, topic_id: @my_topic.id, id: @my_bookmark.id
      expect(response).to redirect_to @my_topic
    end
  end

  describe "DELETE #destroy" do
    it "deletes the bookmark" do
      delete :destroy, topic_id: @my_topic.id, id: @my_bookmark.id

      count = Bookmark.where({id: @my_bookmark.id}).size
      expect(count).to eq 0
    end
  end
end
