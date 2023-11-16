# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  def create
    @commentable = Report.find(params[:report_id])

    super
  end

  private

  def transform_commentable
    @report = @commentable
  end
end
