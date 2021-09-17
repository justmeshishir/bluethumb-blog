class PostsController < ApplicationController
  def index
    @posts = BluethumbService.new.posts
  end

  def new; end

  def create
    post = BluethumbService.new(payload: post_params).create_post

    redirect_to post_path(post['id'])
  end

  def show
    @post = BluethumbService.new(id: params[:id]).find_post if params[:id].present?
  end

  private

  def post_params
    params.permit(:title, :body)
  end
end
