class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @video = Video.find(params[:video_id])
    @review = @video.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to video_path(@video), notice: "Yorum eklendi"
    else
      redirect_to video_path(@video), alert: @review.errors.full_messages.to_sentence
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
