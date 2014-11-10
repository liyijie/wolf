# == Schema Information
#
# Table name: advertisements
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  sub_title  :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Advertisement < ActiveRecord::Base
end
