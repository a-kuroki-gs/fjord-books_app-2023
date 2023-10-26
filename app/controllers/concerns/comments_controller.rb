# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = @imageable.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.imageable_id = @imageable.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to report_url(@comment.imageable), notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { redirect_to report_url(@comment.imageable), status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to report_url(@comment.imageable), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :imageable_id)
  end
end
