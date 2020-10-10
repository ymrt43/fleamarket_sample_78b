class ProfilesController < ApplicationController
  def new
    @parents = Category.where(ancestry: nil)
    @user_params = params
  end
  def create
    redirect_to new_profile_path(request.parameters)
  end

end
