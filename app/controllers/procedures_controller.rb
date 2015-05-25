# Procedure == Process
class ProceduresController < ApplicationController
  def index
    render json: Procedure.all
  end

  def show
    render json: Procedure.find(params[:id])
  end

  def new_comment
    @procedure = Procedure.find(params[:procedure_id])
    @comment = @procedure.comments.new(comment_params)

    if @procedure.save
      render json: Procedure.find(params[:procedure_id])
    else
      render :error
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :from)
  end
end
