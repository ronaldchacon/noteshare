class Favorite < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :note
  belongs_to :user
end
