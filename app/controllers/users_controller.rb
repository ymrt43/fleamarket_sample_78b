class UsersController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def edit
    @parents = Category.where(ancestry: nil)
  end
end
