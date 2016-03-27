require 'rails_helper'
require 'factory_girl'

RSpec.describe TopicsController, type: :controller do

  let(:my_topic) { create(:topic) }

  it { is_expected.to have_many(:bookmarks) }

  describe "attrbutes" do
    it "responds to url" do
      expect(topic).to respond_to(:title)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_topic to @topics" do
      get :index
      expect(assigns(:topics)).to eq([my_topic])
    end
  end

  describe "GET show" do
     it "returns http success" do
       get :show, {id: my_topic.id}
       expect(response).to have_http_status(:success)
     end

    it "renders the #show view" do
      get :show, {id: my_topic.id}
      expect(response).to render_template :show
    end

    it "assigns my_topic to @topic" do
      get :show, {id: my_topic.id}
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
      expect(response).to render_template :new
    end

    it "initializes @topic" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
    it "renders the #edit view" do
       get :edit, {id: my_topic.id}
       expect(response).to render_template :edit
     end

     it "assigns topic to be updated to @topic" do
       get :edit, {id: my_topic.id}
       topic_instance = assigns(:topic)

       expect(topic_instance.id).to eq my_topic.id
       expect(topic_instance.title).to eq my_topic.title
     end
   end

  describe "POST create" do
     it "increases the number of topics by 1" do
       expect { post :create, (:my_topic)}.to change(Topic,:count).by(1)
     end

     it "assigns Topic.last to @topic" do
       post :create,(:my_topic)
       expect(assigns(:topic)).to eq Topic.last
     end

     it "redirects to the new topic" do
       post :create, (:my_topic)
       expect(response).to redirect_to Topic.last
     end
   end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
    it "redirects to topics index" do
      delete :destroy, {id: my_topic.id}
        expect(response).to redirect_to topics_path
end
  end

end
