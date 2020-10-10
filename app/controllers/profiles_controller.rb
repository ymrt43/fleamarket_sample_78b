class ProfilesController < ApplicationController
  def new
    @parents = Category.where(ancestry: nil)
    @user_params = params
  end
  def create
    if params[:password] == params[:password_confirmation]
      redirect_to new_profile_path(request.parameters)
    else
      redirect_to new_user_registration_path, alert: 'パスワードが違います'
    end
  end

end
