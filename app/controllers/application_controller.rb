class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action  :store_location

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

  def store_location
    if (request.fullpath != new_user_registration_path &&
        request.fullpath != new_user_session_path &&
        # request.fullpath != "/users/password" &&
        request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
        !request.xhr?)
      session[:previous_url] = request.fullpath 
    end
  end

  # 新規登録後のリダイレクト先
  def after_sign_in_path_for(resource)
    # 新規登録時
    if session[:previous_url].start_with?(new_profile_path)
      @profile = @user.build_profile
      @address = @user.build_address
      @profile.assign_attributes(profile_params)
      @address.assign_attributes(address_params)
      if current_user.valid?
        current_user.save
        # 成功
        root_path  #　指定したいパスに変更
      else
        current_user.destroy
        # 失敗
        new_user_registration_path  #　指定したいパスに変更
      end
    else
      super
    end
  end


  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation,]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  private
  def profile_params
    params.require(:user).permit(:familyname, :firstname, :familykana, :firstkana, :birthdate)
  end

  def address_params
    params.require(:user).permit(:postalcode, :prefecture_id, :city, :house_number, :building_number, :dial_number)
  end
end
