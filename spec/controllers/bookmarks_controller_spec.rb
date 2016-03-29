require 'support/controller_support'

RSpec.describe BookmarksController, type: :controller do

  describe "GET #show" do
    before :example do
      @topic = create(:topic)
      @bookmark = create(:bookmark, topic_id: @topic.id)
      get :show, topic_id: @topic.id, id: @bookmark.id
    end
    it_behaves_like 'a successful GET action', :show do
    end
  end

  describe "GET #edit" do
    before :example do
      @topic = create(:topic)
      @bookmark = create(:bookmark, topic_id: @topic.id)
      get :edit, topic_id: @topic.id, id: @bookmark.id
    end
    it_behaves_like 'a successful GET action', :edit do
    end
  end

  describe "PUT #update" do

  end

  describe "POST #create" do

  end

  describe "DELETE #destroy" do

  end

end
