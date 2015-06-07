class CommentsController < ApplicationController
  def create
    @procedure = Procedure.find(params[:procedure_id])
    @comment = @procedure.comments.new(comment_params)

    if @procedure.save
      render json: @comment
    else
      render :error
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :from)
  end
end
