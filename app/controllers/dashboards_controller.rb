class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def admin_dashboard
    authorize :dashboard, :admin?
  end

  def instructor_dashboard
    authorize :dashboard, :instructor?
  end

  def student_dashboard
    authorize :dashboard, :student?
  end
end
