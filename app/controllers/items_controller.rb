class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.all
    @images = Image.all
  end

  def new
  end
  
  def show
    @items = Item.find(params[:id])
    @parents = Category.where(ancestry: nil)
  end

  def buy
  end

  def edit
    # @grandchild = Category.find(@items.category_id)
    # @child = @grandchild.parent
    # @parent = @child.parent
  end

  def destroy
    @items = Item.find(params[:id])
    @items.destroy
    redirect_to root_path
  end
  
end
