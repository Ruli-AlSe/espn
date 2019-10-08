class CommentsController < ApplicationController

  def create
    @message == Message.find(params[:message_id])
    @comment = Message.comments.create(comment_params)
    @comment.user_id = currente_user.user_id

    if @comment.save
      flash[:success] = "Comment successfully created"
      redirect_to message_path(@message)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
