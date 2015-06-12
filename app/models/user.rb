class User < ActiveRecord::Base
  has_many :rounds, foreign_key: :player_id # checked
  has_many :decks, foreign_key: :creator_id # checked

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
