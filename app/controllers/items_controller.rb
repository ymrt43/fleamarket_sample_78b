class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy]

  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.new
    @categories = Category.all
    @prefectures = Prefecture.all
  end
  
  def create
    @categories = Category.all
    @prefectures = Prefecture.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @parents = Category.where(ancestry: nil)
  end

  def buy
  end

  def edit
  end

  
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :state, :fee, :prefecture_id, :term, :price, :category_id, images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
