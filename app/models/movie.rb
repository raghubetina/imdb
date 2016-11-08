class Movie < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :characters,
             :dependent => :destroy

  belongs_to :director

  # Indirect associations

  # Validations

end
