class Deck < ActiveRecord::Base
  has_many :rounds # checked
  has_many :cards # checked
  belongs_to :category # checked
  belongs_to :creator, class_name: "User" # checked
end
