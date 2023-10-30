# frozen_string_literal: true

class MentioningReport < ApplicationRecord
  has_many :mentions
  has_many :mentioned_reports, through: :mentions
end
