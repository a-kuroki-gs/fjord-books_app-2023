# frozen_string_literal: true

class Books::CommentsController < CommentsController
  def create
    @imageable = Book.find(params[:book_id])

    super
  end
end
