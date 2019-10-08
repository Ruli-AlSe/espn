class MessagesController < ApplicationController

  def index
    @messages = Message.all.order("created_at DESC")
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Message successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end


private

  def message_params
    params.require(:message).permit(:title, :description)
  end

end
