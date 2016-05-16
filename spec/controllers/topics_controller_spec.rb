require 'rails_helper'

RSpec.describe TopicsController, :type => :controller do

  before :example do
      @user = create(:user)
      sign_in @user
      @my_topic = create(:topic)
    end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: @my_topic.id}
      expect(response).to have_http_status(:success)
    end
    it "renders show template" do
      get :show, {id: @my_topic.id}
      expect(response).to render_template(:show)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: @my_topic.id}
      expect(response).to have_http_status(:success)
    end
  end
end
