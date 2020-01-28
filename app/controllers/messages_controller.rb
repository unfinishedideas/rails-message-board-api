class MessagesController < ApplicationController

  def index
    @messages = Message.all
    json_response(@messages)
  end

  def show
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
    @message = Message.create!(message_params)
    json_response(@message, :created)
  end

  def update
    @message = Message.find(params[:id])
    if @message.update!(message_params)
      render status: 200, json: {
        message: "Message successully updated!"
      }
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy!
      render status: 200, json: {
        message: "DESTROYED Message successfully."
      }
    end
  end

  private
  def message_params
    params.permit(:title, :content, :user_id, :group_id)
  end
end
