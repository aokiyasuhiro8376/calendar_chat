class RoomsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @rooms = Room.all.order(:id)
    @user = User.new(user_params)
  end

  def new
    @user = User.new(user_params)
    @room = Room.new(room_params)
  end

  def create
    @user = User.create(user_params)
  end


  def show
    @room = Room.find(params[:id])
    @chats = Chat.all
    # binding.pry

  end

  # def show
    # メッセージ一覧を取得
    # @chats = Chat.all

    # @room = Room.find(params[:id])
    # #present?の戻り値は真偽値。よって、trueの場合、
    # if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
    #   @chats = @room.chats
    #   @entries = @room.entries
    # else
    #   redirect_back(fallback_location: root_path)
    # end
  # end

  # def create
  #   @room = Room.create(:name => "Chat")
  #   @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
  #   @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
  #   redirect_to room_path(@room.id)
  # end

  # private
  # def user_params
  #   params.require(:user).merge(room_id: params['room'])
  # end

    def user_params
    # params.require(:user).permit(:name, :email).merge(room_id: params['room'])

    params.require(:user).merge(room_id: params['room'])

    # binding.pry

  end

  # def room_params
  #   params.require(:room).merge(user_id: current_user.id)
  # end


end
