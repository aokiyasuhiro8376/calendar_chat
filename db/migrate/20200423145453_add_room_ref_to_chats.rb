class AddRoomRefToChats < ActiveRecord::Migration[5.2]
  def change
    add_reference :chats, :room, foreign_key: true
  end
end
