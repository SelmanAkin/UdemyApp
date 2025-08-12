class DashboardPolicy < Struct.new(:user, :dashboard)
  def admin?
    user.admin?
  end

  def instructor?
    user.instructor?
  end

  def student?
    user.student?
  end
end
