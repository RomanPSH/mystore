class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :total_amount, :address, :phone, :delivery_method, :payment_method, presence: true
end