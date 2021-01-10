class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy edit update]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save!
  end

  def edit
  end

  def update
    @comment.update(comment_update_params)
  end

  def destroy
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end
end
