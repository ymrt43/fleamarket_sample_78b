class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.images.new
    @categories = Category.all
    @prefectures = Prefecture.all
  end
  
  def create
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

  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :state, :fee, :area, :term, :price, :category_id, images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
