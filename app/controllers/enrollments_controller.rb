class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course

  def create
    if current_user.student?
      Enrollment.create!(user: current_user, course: @course)
      redirect_to courses_path, notice: "Kursa başarıyla kayıt oldun."
    else
      redirect_to courses_path, alert: "Sadece öğrenciler kursa kayıt olabilir."
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
