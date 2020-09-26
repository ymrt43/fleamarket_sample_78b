class ProfilesController < ApplicationController
  def new
  end
  def create
    redirect_to action: :new
  end

end
