class Guess < ActiveRecord::Base
  belongs_to :round # checked
  belongs_to :card # checked
end
