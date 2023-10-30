# frozen_string_literal: true

class MentioningReport < ApplicationRecord
  self.table_name = 'reports'
  has_many :mentions, dependent: :destroy
  has_many :mentioned_reports, through: :mentions, dependent: :destroy
end
