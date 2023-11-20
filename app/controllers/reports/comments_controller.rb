# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  def create
    @commentable = Report.find(params[:report_id])
    @report = @commentable

    super
  end

  private

  def render_commentable_show
    'reports/show'
  end
end
