class UsersController < ApplicationController
  def edit
  end
  def update
  end

  def index
    @parents = Category.where(ancestry: nil)
  end

  def edit
    @parents = Category.where(ancestry: nil)
  end
end
