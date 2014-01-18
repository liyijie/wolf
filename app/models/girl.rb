class Girl < ActiveRecord::Base
  belongs_to :grade
  default_scope order: 'id DESC'

  self.per_page = 10

  attr_accessor :fit_error

  def self.avaliables
    indexs = []
    Grade.all.each do |grade|
      indexs << grade.id if grade.to_s == "member" or grade.to_s == "vip"
    end
    where(grade_id: indexs)
  end

  def fit current_user
    user = current_user
    self.fit_error = ""
    user_grade = user.grade.to_s
    girl_grade = self.grade.to_s
    if user_grade == "member" && girl_grade == "vip"
      self.fit_error = "申请失败：此信息仅限VIP成员申请"
      return false
    end

    if user_grade == "none"
      self.fit_error = "申请失败：此信息仅限VIP成员申请"
      return false
    end

    if user.city != self.city
      self.fit_error = "申请失败：不在同一城市不允许申请，VIP成员请联系管理员"
      return false
    end
    
    if !(user.age >= self.age_min and user.age <= self.age_max \
      and user.height >= self.height_min and user.height <= self.height_max \
      and user.weight >= self.weight_min and user.weight <= self.weight_max)
      self.fit_error = "申请失败：您不符合对方的要求"
      return false
    end

    return true
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
