# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  fixtures :users, :reports

  def setup
    @user = users(:alice)
  end

  test 'editable?' do
    @report = reports(:one)

    assert @report.editable?(@user)
  end

  test 'created_on' do
    @report = reports(:one)

    assert_equal @report.created_at.to_date, @report.created_on
  end

  test 'save_mentions' do
    @user = users(:bob)
    @first_report = reports(:one)
    @second_report = reports(:two)

    @report = @user.reports.build(title: 'MyString', content: "http://localhost:3000/reports/#{@first_report.id}")

    assert_empty @report.mentioning_reports
    @report.save!
    assert_equal @report.mentioning_reports.first, @first_report

    @report.update!(content: "http://localhost:3000/reports/#{@second_report.id}")
    @report.mentioning_reports.reload
    assert_equal @report.mentioning_reports.first, @second_report
  end
end
