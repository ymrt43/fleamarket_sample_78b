class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create, :search]
  before_action :set_parents, except: [:destroy, :buy]
  before_action :set_prefectures, only: [:new, :create, :edit, :update]

  def index
    @items = Item.all.includes(:images)
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      @item.images.new
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @children = Category.find(params[:parent_id]).children
        elsif params[:child_id]
          @grandchildren = Category.find(params[:child_id]).children
        end
      end
    end
  end

  def buy
  end  

  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :state, :fee, :prefecture_id, :term, :price, :category_id, images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
  
  def set_prefectures
    @prefectures = Prefecture.all
  end

end
