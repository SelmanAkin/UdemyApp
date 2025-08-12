class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:new, :create]
  before_action :authorize_instructor!, only: [:new, :create]

  def new
    @video = @course.videos.build
  end

  def create
    @video = @course.videos.build(video_params)
    if @video.save
      redirect_to course_video_path(@course, @video), notice: "Video yüklendi."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @video = Video.find(params[:id])
    @reviews = @video.reviews
  end


  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :file)
  end

  def authorize_instructor!
    authorize @course, :create?
  end
end
