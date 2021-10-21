class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy

  accepts_nested_attributes_for :user

  validates :device_model, presence: true
  validates :device_imei, presence: true
  validates :annual_price, presence: true
end
