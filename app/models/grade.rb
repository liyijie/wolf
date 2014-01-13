class Grade < ActiveRecord::Base
  has_many :girls
  has_many :users
end
