require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /index" do
    it "render index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "render new page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'valid data' do
      it "be successful" do
        post :create, params: { title: "Test title", body: "Testing the body" }, as: :json
        expect(response).to be_successful
      end
    end
  end
end
