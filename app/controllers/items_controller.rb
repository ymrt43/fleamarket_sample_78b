class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.all
    @images = Image.all
  end

  def new
  end
  
  def show
    @parents = Category.where(ancestry: nil)
    @items = Item.find(params[:id])
  end
  def buy
  end
  
end
