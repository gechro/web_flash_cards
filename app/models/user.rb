class User < ActiveRecord::Base
  has_many :rounds, foreign_key: :player_id # checked
  has_many :decks, foreign_key: :creator_id # checked
end
