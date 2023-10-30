# frozen_string_literal: true

class Mention < ApplicationRecord
  belongs_to :mentioned_reports, class_name: 'MentionedReport', foreign_key: 'mentioned_report_id'
  belongs_to :mentioning_reports, class_name: 'MentioningReport', foreign_key: 'mentioning_report_id'
end
