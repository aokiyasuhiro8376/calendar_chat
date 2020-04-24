class Room < ApplicationRecord
  has_many :chats
  has_many :users
end
