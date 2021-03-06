class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.purchase.present? || @item.user_id == current_user.id 
      redirect_to root_path
    else
      @purchase_addressee = PurchaseAddressee.new
    end
  end

  def create
    @purchase_addressee = PurchaseAddressee.new(purchase_params)
    if @purchase_addressee.valid?
      pay_item
      @purchase_addressee.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_addressee).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :tel_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end