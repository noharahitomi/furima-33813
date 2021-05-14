class PurchaseAddressees
  include Activemodel::module
    attr_accesser :user_id, :item_id, :number, :cvc, :exp_month, :exp_year, :post_code, :prefecture_id, :municipality, :address, :building_name, :tel_number, :purchase

    with_options presence: true do
      validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :municipality, :address, :purchase, :user_id, :item_id
      validates :tel_number, :number, :cvc, :exp_month, :exp_year,  numericality: {only_integer: true }
    end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id, number: number, cvc: cvc, exp_month: exp_month, exp_year: exp_year)
      Addressees.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, tel_number: tel_namuber, purchase: purchase)
    end
  end
end