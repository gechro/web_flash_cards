class Category < ActiveRecord::Base
  has_many :decks # checked

  validates :name, presence: true
end
