# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :post_code, presence: true, length: { is: 7 }, format: { with: /\A[0-9]+\z/ }
  validates :address, presence: true
  validates :self_introduction, presence: true
end
