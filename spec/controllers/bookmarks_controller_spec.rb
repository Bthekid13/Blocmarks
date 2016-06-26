require 'rails_helper'

describe BookmarksController do

  before :example do
    @user = create :user
    sign_in @user
  end

  describe "GET #show" do
    before :example do
      @topic = create :topic
      @bookmark = create(:bookmark, topic_id: @topic.id)
      get :show, topic_id: @topic.id, id: @bookmark.id
    end

  end

  describe "GET #edit" do
    before :example do
      @topic = create :topic
      @bookmark = create(:bookmark, topic_id: @topic.id)
      get :edit, topic_id: @topic.id, id: @bookmark.id
    end
  end

end
