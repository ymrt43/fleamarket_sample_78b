class ProfilesController < ApplicationController
  def new
    @parents = Category.where(ancestry: nil)
  end
  def create
    redirect_to action: :new
  end

end
