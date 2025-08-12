class AiController < ApplicationController
  def ask
    service = OpenAIService.new(params[:prompt])
    @response = service.chat
    render json: { answer: @response }
  end
end