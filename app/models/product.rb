class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :order_items, dependent: :destroy
  validates :title, :description, :brand, :product_type, :engine_type, :color, :cost, presence: true
end
