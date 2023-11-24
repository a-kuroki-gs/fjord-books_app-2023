# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  fixtures :reports

  setup do
    @report = reports(:one)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
    assert_text 'ログインしました。'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報の一覧'
  end

  test 'should create report' do
    visit reports_url
    click_on '日報の新規作成'

    fill_in 'タイトル', with: 'gitに苦戦'
    fill_in '内容', with: '何だかひょろひょろは別に否によっているなば、私にも当時いっぱいなどあなたのお創設も若い得下さろるた。'
    click_on '登録する'

    assert_selector 'h1', text: '日報の詳細'
    assert_text '日報が作成されました。'
    assert_text 'gitに苦戦'
    assert_text '何だかひょろひょろは別に否によっているなば、私にも当時いっぱいなどあなたのお創設も若い得下さろるた。'
    assert_text 'alice'
    assert_text Time.zone.today.strftime('%Y/%m/%d')
  end

  test 'should update Report' do
    visit report_url(@report)
    click_on 'この日報を編集', match: :first

    fill_in 'タイトル', with: 'lsコマンドむずすぎへん？'
    fill_in '内容', with: 'それも同年もっとその教育家というのの後がつけよただ。'
    click_on '更新する'

    assert_selector 'h1', text: '日報の詳細'
    assert_text '日報が更新されました。'
    assert_text 'lsコマンドむずすぎへん？'
    assert_text 'それも同年もっとその教育家というのの後がつけよただ。'
    assert_text 'alice'
    assert_text Time.zone.today.strftime('%Y/%m/%d')
  end

  test 'should destroy Report' do
    visit report_url(@report)
    click_on 'この日報を削除', match: :first

    assert_text '日報が削除されました。'
    assert_selector 'h1', text: '日報の一覧'
    assert_nil Report.find_by(id: @report.id)
  end
end
