class RepliesController < ApplicationController
  def index
    @procedure = Procedure.find(params[:procedure_id])
    @rule = @procedure.rules.find(params[:rule_id])
    @question = @rule.questions.find(params[:question_id])

    @replies = @question.replies
  end

  def create
    @procedure = Procedure.find(params[:procedure_id])
    @rule = @procedure.rules.find(params[:rule_id])
    @question = @rule.questions.find(params[:question_id])

    @reply = @question.replies.new(reply_params)

    if @procedure.save
      render json: @reply
    else
      render :error
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:text, :from)
  end
end
