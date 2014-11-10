# == Schema Information
#
# Table name: grades
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Grade < ActiveRecord::Base
  has_many :girls
  has_many :users

  def to_s
    self.name.to_s
  end
end
