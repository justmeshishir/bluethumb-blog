# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    let(:last_post) { BluethumbService.new.posts.last }

    context 'valid data' do
      it 'returns successful response' do
        post :create, params: { "post_id": last_post['id'], name: 'Test comment', body: 'Test Body' },
                      as: :json, format: :js
        expect(response).to be_successful
      end
    end

    context 'invalid data' do
      it 'redirect to post path' do
        post :create, params: { "post_id": last_post['id'] }, format: :js
        expect(response).to redirect_to(post_path(last_post['id']))
      end
    end
  end
end