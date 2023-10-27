# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader

  validates :title, presence: true
  validates :memo, presence: true
  validates :author, presence: true
  validates :picture, presence: true
end
