class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_item, only: [:edit, :update, :destroy, :show]
  before_action :exhibitors_only, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @item.destroy
    redirect_to root_path
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, :delivery_fee_id, :delivery_area_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def exhibitors_only
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
