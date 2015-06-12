class Card < ActiveRecord::Base
  belongs_to :deck # checked
  has_many :guesses # checked
  has_many :rounds, through: :guesses # checked 

  validates :question, presence: true
  validates :answer, presence: true
end
