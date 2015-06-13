class Guess < ActiveRecord::Base
  belongs_to :round # checked
  belongs_to :card # checked

  validates :correct, presence: true
end
