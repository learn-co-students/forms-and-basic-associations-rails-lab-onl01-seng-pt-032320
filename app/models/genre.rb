class Genre < ActiveRecord::Base
  # add associations
  has_many :song
end
