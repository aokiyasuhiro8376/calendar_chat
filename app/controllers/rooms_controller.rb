class RoomsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @rooms = Room.all.order(:id)
    @user = User.find_by(params[:room_id])
  end

  def create
    @user = User.create(user_params)
  end


  def show
    @room = Room.find(params[:id])
    @chats = Chat.all
    user = User.find(params[:id])
  end

  private
  def user_params
  params.require(:user).merge(room_id: params['room'])
  end
end
