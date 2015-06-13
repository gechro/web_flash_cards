class User < ActiveRecord::Base
  include BCrypt
  has_many :rounds, foreign_key: :player_id # checked
  has_many :decks, foreign_key: :creator_id # checked

  validates :name, presence: true
  validates :email, presence: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end
end
