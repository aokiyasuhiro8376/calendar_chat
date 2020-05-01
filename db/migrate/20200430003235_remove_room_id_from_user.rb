class RemoveRoomIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :room_id, :bigint
  end
end
