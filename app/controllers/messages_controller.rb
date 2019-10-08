class MessagesController < ApplicationController

  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order("created_at DESC")
  end

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "Message successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
      if @message.update(message_params)
        flash[:success] = "Message was successfully updated"
        redirect_to @message
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    if @message.destroy
      flash[:success] = 'Message was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to @message
    end
  end

private

  def message_params
    params.require(:message).permit(:title, :description)
  end

  def find_message
    @message = Message.find(params[:id])
  end

end
