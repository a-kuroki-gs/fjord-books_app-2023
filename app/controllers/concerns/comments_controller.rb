# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to polymorphic_path(@comment.commentable), notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { redirect_to polymorphic_path(@comment.commentable), status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to polymorphic_path(@comment.commentable), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
      end
    else
      redirect_to polymorphic_path(@comment.commentable)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
