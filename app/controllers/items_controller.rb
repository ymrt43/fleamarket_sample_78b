class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]

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
    # binding.pry
    @categories = Category.all
    @prefectures = Prefecture.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
    @prefectures = Prefecture.all
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @parents = Category.where(ancestry: nil)
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :new
    end
  end

  def buy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :state, :fee, :prefecture_id, :term, :price, :category_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
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
