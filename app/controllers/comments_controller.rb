class CommentsController < ApplicationController

  def create
    post = BluethumbService.new(id: params[:post_id]).find_post
    return if post.blank?

    @comment = BluethumbService.new(id: post['id'], payload: comment_params).create_comment
  end

  private

  def comment_params
    params.permit(:name, :body)
  end
end
