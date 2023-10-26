# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  def create
    @imageable = Report.find(params[:report_id])

    super
  end
end
