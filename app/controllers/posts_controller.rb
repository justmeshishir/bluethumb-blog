class PostsController < ApplicationController
  def index
    @posts = BluethumbService.new.posts.sort! { |a, b| b['created_at'] <=> a['created_at'] }
  end

  def new; end

  def create
    response = BluethumbService.new(payload: post_params).create_post

    render :new and return if errors? response

    respond_to do |format|
      format.html { redirect_to post_path(response['post']['id']) }
      format.json { render json: response['post'], status: :ok }
    end
  end

  def show
    @post = BluethumbService.new(id: params[:id]).find_post if params[:id].present?
  end

  private

  def post_params
    params.permit(:title, :body)
  end
end
