class UsersController < ApplicationController
  def edit
    @parents = Category.where(ancestry: nil)
  end
  def update
    @parents = Category.where(ancestry: nil)
  end

  def index
    @parents = Category.where(ancestry: nil)
  end

  def edit
    @parents = Category.where(ancestry: nil)
  end

  def signup
  end

end
