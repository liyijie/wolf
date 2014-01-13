class Girl < ActiveRecord::Base
  belongs_to :grade

  def self.all_fit current_user
    user = current_user
    return [] unless user
    user_grade = user.grade.to_s
    girls = Girl.all
    fit_girls = []
    girls.each do |girl|
      if user_grade == "vip"
        fit_girls << girl if girl.grade == "member" || girl.grade == "vip"
      elsif user_grade == "member"
        fit_girls << girl if girl.grade == "member"
      end
    end
  end

  def fit? current_user
    user = current_user
    user.age >= self.age_min and user.age <= self.age_max \
      and user.height >= self.height_min and user.height <= self.height_max \
      and user.age >= self.age_min and user.age <= self.age_max
  end

  def age
    self.birth.nil? ? 0 : Time.now.year - self.birth.year
  end

  def info
    "#{self.city} #{self.age}岁 #{self.height}cm #{self.weight}kg"
  end

  def demand
    "要求男生年龄#{self.age_min}~#{self.age_max}岁 身高:#{self.height_min}~#{self.height_max}cm 体重:#{self.weight_min}~#{self.weight_max}kg"
  end
end
