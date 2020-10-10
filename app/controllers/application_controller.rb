class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
  def production?
    Rails.env.production?
  end

    # 新規登録後のリダイレクト先
    def after_sign_in_path_for(resource)
    @profile = @user.build_profile
    @address = @user.build_address
    @profile.assign_attributes(profile_params)
    @address.assign_attributes(address_params)
    # if @user.save
    # else
      # @user.destroy
    # end
      if current_user.valid?
        current_user.save
        # 成功
        root_path  #　指定したいパスに変更
      else
        current_user.destroy
        # 失敗
        new_user_registration_path  #　指定したいパスに変更
      end
    end


  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    
  end

  private
  def profile_params
    params.require(:user).permit(:familyname, :firstname, :familykana, :firstkana, :birthdate)
  end

  def address_params
    params.require(:user).permit(:postalcode, :prefecture, :city, :house_number, :building_number, :dial_number)
  end
end
