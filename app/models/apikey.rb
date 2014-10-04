class Apikey < ActiveRecord::Base
  belongs_to :user
  has_many :buttons
end
