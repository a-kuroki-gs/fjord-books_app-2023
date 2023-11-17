# frozen_string_literal: true

class Books::CommentsController < CommentsController
  def create
    @commentable = Book.find(params[:book_id])

    super
  end

  private

  def render_commentable_show(format)
    @book = @commentable
    @comments = @book.comments.order(:id)
    format.html { render 'books/show', status: :unprocessable_entity }
  end
end
