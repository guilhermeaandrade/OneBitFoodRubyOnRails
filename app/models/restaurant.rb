class Restaurant < ApplicationRecord
  geocoded_by :address

  belongs_to :category
  has_many :product_categories
  has_many :orders
  has_many :reviews

  validates_associated :category
  validates :name, :status, :delivery_tax, :city, :street, presence: true

  enum status: { closed: 0, open: 1 }

  has_one_attached :image

  after_validation :geocode

  def address
    [street, number, city, state].reject(&:blank?).join(', ')
  end
end
