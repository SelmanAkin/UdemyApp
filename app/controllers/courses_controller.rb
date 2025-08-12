class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_course, only: [:show]

  def index
    @courses = Course.all
  end

  def new
    @course = current_user.courses.build
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      redirect_to @course, notice: "Kurs başarıyla oluşturuldu"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @course = Course.find(params[:id])
    authorize @course
    @course.destroy
    redirect_to courses_path, notice: "Kurs silindi."
  end


  def show
    @videos = @course.videos
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :price)
  end
end
