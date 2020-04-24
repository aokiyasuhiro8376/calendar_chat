# class ChatBroadcastJob < ApplicationJob
#   queue_as :default

#   def perform(*args)
#     # Do something later
#   end
# end



class DirectMessageBroadcastJob < ApplicationJob
  # queue_as :default

  def perform(chat)
    ActionCable.server.broadcast "room_channel_#{chat.room_id}", chat: render_chats(chat)
  end

  private

    def render_chats(chat)
      ApplicationController.renderer.render partial: 'chats/chat', locals: { chat: chat }
    end
end