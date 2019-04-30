class Product < ApplicationRecord
  belongs_to :product_category
  has_many :order_products

  has_one_attached :image

  validates_associated :product_category
  validates :name, :price, presence: true
end
