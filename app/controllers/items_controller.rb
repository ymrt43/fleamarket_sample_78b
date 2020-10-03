class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.images.new
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
    params.require(:item).permit(:name, :desctioption, :brand, :state, :fee, :area, :term, :price, :category_id, images_attributes: [:src]).merge(user_id: current_user.id)
  end
end
