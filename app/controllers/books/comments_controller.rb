# frozen_string_literal: true

class Books::CommentsController < CommentsController
  def create
    @commentable = Book.find(params[:book_id])
    @book = @commentable

    super
  end

  private

  def render_commentable_show
    'books/show'
  end
end
