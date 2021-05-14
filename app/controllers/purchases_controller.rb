class PurchasesController < ApplicationController
  def index
    @purchase_addresse = PurchaseAddressee.new
  end

  def create
    binding.pry
    @purchase_addresse = PurchaseAddressee.create(purchase_params)
    if @purchase_addressee.valid?
      @purchase_addressee.save
      redirect_to root_path
    end
  end

  private
  def purchase_params
    params.require(:purshase_addressee).permit(:number, :cvc, :exp_month, :exp_year, :post_code, :prefecture_id, :municipality, :address, :building_name, :tel_number).merge(user_id: current_user.id, item_id: item.id)
end
