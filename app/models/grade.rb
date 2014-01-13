class Grade < ActiveRecord::Base
  has_many :girls
  has_many :users

  def to_s
    self.name.to_s
  end
end
