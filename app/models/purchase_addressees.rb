class PurchaseAddressees
  include Activemodel::module
    attr_accesser :post_code, :prefecture_id, :municipality, :address, :building_name, :tel_number, :purchase

    # ここにバリデーション

    def save
      
    end
  end