class PurchasesController < ApplicationController
  def index
    @purchase_addressee = PurchaseAddressee.new
  end

  def create
    @purchase_addressee = PurchaseAddressee.new(purchase_params)
    if @purchase_addressee.valid?
      @purchase_addressee.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_addressee).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :tel_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end