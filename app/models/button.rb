class Button < ActiveRecord::Base
  belongs_to :apikey
  has_many :buttoncontacts
end
