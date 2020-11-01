class UsersController < ApplicationController
  before_action :set_parents

  def edit
  end

  def update
  end

  def index
  end

  def edit
  end

  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
