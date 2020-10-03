class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.images.new
  end
  
  def show
    @parents = Category.where(ancestry: nil)
  end
  def buy
  end
  
end
