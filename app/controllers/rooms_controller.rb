class RoomsController < ApplicationController
  # before_action :authenticate_user!

#   def index
#     @rooms = Room.all.order(:id)
#     @user = User.find_by(params[:room_id])
#   end

#   def create
#     @user = User.create(user_params)
#   end


#   def show
#     @room = Room.find(params[:id])
#     @chats = Chat.all
#     user = User.find(params[:id])
#   end

#   private
#   def user_params
#   params.require(:user).merge(room_id: params['room'])
#   end
# end




  def index
    @user = current_user
    @currentEntries = current_user.entries
    #@currentEntriesのルームを配列にする
    myRoomIds = []
    @currentEntries.each do |entry|
      myRoomIds << entry.room.id
    end
    #@currentEntriesのルーム且つcurrent_userでないEntryを新着順で取ってくる
    @anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: @user.id).order(created_at: :desc)
  end

  def show
    @room = Room.find(params[:id])
    #ルームが作成されているかどうか
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @chats = @room.chats
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.create(:name => "chat")
    #entryにログインユーザーを作成
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    #entryにparamsユーザーを作成
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to room_path(@room.id)
  end

  def destroy
      room = Room.find(params[:id])
      room.destroy
      redirect_to users_rooms_path
  end
end
