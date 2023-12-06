# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :active_relationship, class_name: 'Mention', foreign_key: :mentioned_report_id, dependent: :destroy, inverse_of: :mentioned_report
  has_many :mentioning_reports, through: :active_relationship

  has_many :passive_relationship, class_name: 'Mention', foreign_key: :mentioning_report_id, dependent: :destroy, inverse_of: :mentioning_report
  has_many :mentioned_reports, through: :passive_relationship

  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end

  def save_mention
    report_ids = content.scan(%r{http://localhost:3000/reports/(\d{1,})}).flatten
    reports = Report.where.not(id:).where(id: report_ids)
    raise ActiveRecord::Rollback unless self.mentioning_reports += reports
  end

  def create_transaction
    ActiveRecord::Base.transaction do
      save
      save_mention
      true
    end
  end

  def update_transaction(report_params)
    ActiveRecord::Base.transaction do
      update(report_params)
      raise ActiveRecord::Rollback unless mentioning_reports.destroy_all

      save_mention
      true
    end
  end
end
