class PurchasingManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :non_exhibitor, only: [:index]
  before_action :already_purchased, only: [:index]

  def index
    @personal_purchasing = PersonalPurchasing.new
  end
  
  def create
    @personal_purchasing = PersonalPurchasing.new(personal_purchasing_params)
    if @personal_purchasing.valid?
      pay_item
      @personal_purchasing.save
      return redirect_to root_path
    else
      set_item
      render :index
    end
  end
  
  private
  def personal_purchasing_params
    params.require(:personal_purchasing).permit(:postal_code, :delivery_area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = "sk_test_5664367c06ce6e6d1d77f4a5"
    Payjp::Charge.create(
      amount: @item.price,
      card: personal_purchasing_params[:token],
      currency: 'jpy'
    )
  end
  
  def non_exhibitor
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def already_purchased
    if @item.purchasing_management.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
