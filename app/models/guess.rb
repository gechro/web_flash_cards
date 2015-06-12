class Guess < ActiveRecord::Base
  belongs_to :round # checked
  belongs_to :card # checked

  validates :round_id, presence: true
  validates :card_id, presence: true
  validates :correct, presence: true
end
