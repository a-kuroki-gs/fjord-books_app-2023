# frozen_string_literal: true

class Books::CommentsController < CommentsController
  def create
    @commentable = Book.find(params[:book_id])

    super
  end

  private

  def transform_commentable
    @book = @commentable
  end
end
