# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  def create
    @commentable = Report.find(params[:report_id])

    super
  end

  private

  def render_commentable_show(format)
    @report = @commentable
    @comments = @report.comments.order(:id)
    format.html { render 'reports/show', status: :unprocessable_entity }
  end
end
