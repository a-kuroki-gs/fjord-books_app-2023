# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(email: 'user@example.com', password: 'password')
    @report = @user.reports.build(id: 1, title: 'title', content: 'content')
    @report.save!
  end

  test 'editable?' do
    assert @report.editable?(@user)
  end

  test 'created_on' do
    assert_equal @report.created_at.to_date, @report.created_on
  end

  test 'save_mentions' do
    report = @user.reports.build(id: 2, title: 'title', content: 'content')
    report.save!

    mention_report = @user.reports.build(title: 'title', content: 'http://localhost:3000/reports/1')

    assert_empty mention_report.mentioning_reports
    mention_report.save!
    assert_equal mention_report.mentioning_reports.first, Report.find(1)

    mention_report.update!(content: 'http://localhost:3000/reports/2')
    mention_report.mentioning_reports.reload
    assert_equal mention_report.mentioning_reports.first, Report.find(2)
  end
end
