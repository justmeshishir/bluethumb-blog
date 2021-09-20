require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    let(:last_post) { BluethumbService.new.posts.last }

    it "returns successful response" do
      post :create, params: { "post_id": last_post['id'], name: "Test comment", body: "Test Body"} , as: :json, format: :js
      expect(response).to be_successful
    end
  end
end