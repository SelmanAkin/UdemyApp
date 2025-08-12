class MessagesController < ApplicationController
  before_action :authenticate_user!

 def index
  @received_messages = Message.where(receiver: current_user).order(created_at: :desc)
  @sent_messages = Message.where(sender: current_user).order(created_at: :desc)
  @users = User.where.not(id: current_user.id)
  @message = Message.new
end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    if @message.save
      redirect_to messages_path, notice: "Mesaj gönderildi"
    else
      redirect_to messages_path, alert: "Mesaj gönderilemedi"
    end
  end
 def destroy
  @message = Message.find(params[:id])
    if @message.sender == current_user
     @message.destroy
     redirect_to messages_path, notice: "Mesaj silindi"
    else
     redirect_to messages_path, alert: "Bu mesajı silme yetkiniz yok"
    end
  end
  private

  def message_params
    params.require(:message).permit(:receiver_id, :body)
  end
end
