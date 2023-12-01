# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit update destroy]

  def index
    @reports = Report.includes(:user).order(id: :desc).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
  end

  # GET /reports/new
  def new
    @report = current_user.reports.new
  end

  def edit; end

  def create
    @report = current_user.reports.new(report_params)
    result = @report.create_trunsaction

    ActiveRecord::Base.transaction do
      @report.save
      @report.save_mention
    end
    redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
  rescue ActiveRecord::RecordNotSaved
    flash[:alert] = t('controllers.common.alert_save_failed', name: Report.model_name.human)
    render :new, status: :unprocessable_entity
  end

  def update
    result = @report.update_trunsaction(report_params)

      @report.save_mention
    end
    redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
  rescue ActiveRecord::RecordNotSaved
    flash[:alert] = t('controllers.common.alert_save_failed', name: Report.model_name.human)
    render :edit, status: :unprocessable_entity
  end

  def destroy
    @report.destroy

    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
