class RoomChannel < ApplicationCable::Channel
  def subscribed
    # フロントとバックが通信しているとき(お互いを監視しているとき)に実行される
    stream from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
