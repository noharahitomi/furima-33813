class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image
  belongs_to :user

  validates :image, :name,:info,:price,:category_id,:sales_status_id,:shipping_fee_status_id,:prefecture_id,:scheduled_delivery_id, presence: true
  validates :category_id,:sales_status_id,:shipping_fee_status_id,:prefecture_id,:scheduled_delivery_id, numericality: { other_than: 1 }
  validates :price, numericality: {greater_than: 300, less_than: 9999999}
  validates :price, numericality: true
end
