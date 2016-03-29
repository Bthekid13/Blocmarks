require 'rails_helper'


RSpec.shared_examples_for 'an unauthorized action' do
  it "responds redirect with an HTTP 302 status code" do
    expect(response).to be_redirect
    expect(response).to have_http_status(:found)
  end
  it "provides a flash warning message" do
    expect(flash[:warning]).to_not be_nil
  end
  it "redirects to login_path" do 
    expect(response).to redirect_to root_path
  end
end

RSpec.shared_examples_for "a successful GET action" do |action|
  it "responds successfully with an HTTP 200 status code" do
    expect(response).to be_success
    expect(response).to have_http_status(200) 
  end
  it "renders the #{action} template" do
    expect(response).to render_template(action})
  end
end

RSpec.shared_examples_for "a 302 redirect request action" do |path_name|
  it "responds with a redirect HTTP 302 status code" do
    expect(response).to be_redirect
    expect(response).to have_http_status(:found)
  end
  it "redirects to #{path_name}" do 
    expect(response).to redirect_to redirect_path
  end
end
