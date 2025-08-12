class CoursePolicy < ApplicationPolicy
  def destroy?
    return false unless user
    user.admin? || user.instructor?
  end


  def create?
    return false unless user
    user.admin? || user.instructor?
  end


  def update?
    user.admin? || user.instructor?
  end

  def enroll?
    user.student?
  end
end
