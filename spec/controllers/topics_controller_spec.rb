require 'support/controller_support'

RSpec.describe TopicsController, type: :controller do

  describe "GET #show" do
    before :example do
      @topic = create(:topic)
      get :show, id: @topic.id
    end
      it_behaves_like "A successful GET action", :show do
    end
  end

  describe "GET #index" do

  end

  describe "GET #edit" do

  end

  describe "PUT #update" do

  end

  describe "POST #create" do

  end

  describe "DELETE #destroy" do

  end

end
