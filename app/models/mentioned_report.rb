# frozen_string_literal: true

class MentionedReport < ApplicationRecord
  self.table_name = 'reports'
  has_many :mentions, dependent: :destroy
  has_many :mentioning_reports, through: :mentions, dependent: :destroy
end
