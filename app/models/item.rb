class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :scheduled_delivery
  has_one_attached :image

  validates :name,:info,:price, presence: true
  validates :category,:sales_status,:shipping_fee_status,:prefecture,:scheduled_delivery, numericality: { other_than: 1 }
end