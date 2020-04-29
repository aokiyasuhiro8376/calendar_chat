class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # dependent: :destroyは、userが消えればchatも消えるようにするため
  has_many :chats, dependent: :destroy
  has_many :entries
  has_many :rooms, through: :entries

end
