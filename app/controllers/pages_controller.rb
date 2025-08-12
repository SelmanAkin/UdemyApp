class PagesController < ApplicationController
  def home
    @featured_courses = Course.limit(6)
  end
    def ask_ai
    prompt = params[:prompt]
    service = OpenAiService.new(prompt)
    @response = service.chat

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path, notice: @response }
    end
  end
end
