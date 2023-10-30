# frozen_string_literal: true

class MentionedReport < ApplicationRecord
  has_many :mentions
  has_many :mentioning_reports, through: :mentions
end
