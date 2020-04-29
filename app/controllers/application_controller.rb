class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

  #ログイン時
  def after_sign_in_path_for(resource)
    @user = User.find_by(params[:room_id])
    room_path(@user.room_id)
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
end
