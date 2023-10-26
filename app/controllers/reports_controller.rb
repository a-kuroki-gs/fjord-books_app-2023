# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
    @comment = Comment.new
    @comments = @report.comments
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id

    respond_to do |format|
      if @report.save
        format.html { redirect_to report_url(@report), notice: t('controllers.common.notice_create', name: Report.model_name.human) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report_url(@report), notice: t('controllers.common.notice_update', name: Report.model_name.human) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report = Report.find(params[:id])

    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :content, :created_at)
  end
end
