class CommentsController < ApplicationController

  def create
    post = BluethumbService.new(id: params[:post_id]).find_post
    return if post.blank?

    response = BluethumbService.new(id: post['id'], payload: comment_params).create_comment
    redirect_to post_path(post['id']) and return if errors? response

    @comment = response['comment']
  end

  private

  def comment_params
    params.permit(:name, :body)
  end
end
