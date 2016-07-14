require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let!(:my_user) { create(:user) }
  let!(:my_topic) { create(:topic, user: my_user) }

  before do
    sign_in(my_user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns Topic.all to @topics" do
      get :index
      expect(assigns(:topics)).to eq([my_topic])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, { id: my_topic.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, { id: my_topic.id }
      expect(response).to render_template(:show)
    end

    it "assigns my_topic to @topic" do
      get :show, { id: my_topic.id }
      expect(assigns(:topic)).to eq(my_topic)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template(:new)
    end

    it "initializes @topic" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the number of topics by 1" do
      expect{ post :create, { topic: { title: "New Title", user: my_user }}}.to change(Topic, :count).by(1)
    end

    it "assigns Topic.last to @topic" do
      post :create, { topic: { title: "New Title", user: my_user }}
      expect(assigns(:topic)).to eq Topic.last
    end

    it "redirects to the new topic" do
      post :create, { topic: { title: "New Title", user: my_user }}
      expect(response).to redirect_to Topic.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, { id: my_topic.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, { id: my_topic.id }
      expect(response).to render_template(:edit)
    end

    it "assigns topic to be updated to @topic" do
      get :edit, { id: my_topic.id }
      topic_instance = assigns(:topic)

      expect(topic_instance.id).to eq my_topic.id
      expect(topic_instance.title).to eq my_topic.title
    end
  end

  describe "PUT #update" do
    it "updates topic with expected attributes" do
      new_title = "New Title"
      put :update, id: my_topic.id, topic: { title: new_title }
      updated_topic = assigns(:topic)

      expect(updated_topic.id).to eq my_topic.id
      expect(updated_topic.title).to eq new_title
    end

    it "redirects to the updated topic" do
      new_title = "New Title"
      put :update, id: my_topic.id, topic: { title: new_title }

      expect(response).to redirect_to my_topic
    end
  end

end
