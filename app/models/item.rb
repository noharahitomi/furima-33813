class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, :category, :sales_status

  validates :name,:info, presence :true
  validates :category_id,:sales_status,:shipping_fee_status,:prefecture_id,:scheduled_delivery, numericality: { other_than: 1 }
end