class User < ActiveRecord::Base

  has_many :notes
  has_many :favorites
  has_many :favorite_notes, through: :favorites, source: :note

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(entered_password)
    self.password == entered_password
  end
end
