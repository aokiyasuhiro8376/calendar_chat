class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :message, presence: true

  #ブロードキャスト
  after_create_commit { ChatBroadcastJob.perform_later self }
end
