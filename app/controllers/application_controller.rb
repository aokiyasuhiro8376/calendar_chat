class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

  def new
    @user = User.new(user_params)
  end

  #ログイン時
  def after_sign_in_path_for(resource)
    chat_path(@user.id)
  end

  #ログアウト時
  def after_sign_out_path_for(resource)
    root_path
  end

  private
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :name])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:name])
  end

  def user_params
    params.require(:user).permit(:id)
  end
end
