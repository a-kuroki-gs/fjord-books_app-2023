# frozen_string_literal: true

class Mention < ApplicationRecord
  belongs_to :mentioned_reports
  belongs_to :mentioning_reports
end
