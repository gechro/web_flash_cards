class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards
  belongs_to :category
  belongs_to :creator, through: :rounds, source: :user
end
