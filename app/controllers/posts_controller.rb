class PostsController < ApplicationController
  def index
    @posts = BluethumbService.posts
  end

  def show
    @post = BluethumbService.find_post(params[:id]) if params[:id].present?
  end
end
