class Round < ActiveRecord::Base
  belongs_to :player, class_name: "User" # checked
  belongs_to :deck # checked
  has_many :guesses # checked
  has_many :cards, through: :guesses # checked
end
