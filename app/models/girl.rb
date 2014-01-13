class Girl < ActiveRecord::Base
  belongs_to :grade
  def age
    Time.now.year - self.birth.year
  end
end
