class PurchaseAddressee
  include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :tel_number, :purchase

    with_options presence: true do
      validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :municipality, :address, :user_id, :item_id
      validates :tel_number, format: {with: /\A\d{11}\z/ }
    end
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      binding.pry
      Addressee.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, tel_number: tel_number, purchase_id: purchase.id)
    end
end