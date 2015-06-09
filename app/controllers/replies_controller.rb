class RepliesController < ApplicationController
  before_action :find_parameters

  def index
    @replies = @question.replies
  end

  def create
    @reply = @question.replies.new(reply_params)

    if @procedure.save
      render json: @reply
    else
      render :error
    end
  end

  def likes
    @reply = @question.replies.find(params[:reply_id])
    @reply.likes += 1

    if @reply.save
      render json: @question.replies
    else
      render :error
    end
  end

  private

  def find_parameters
    @procedure = Procedure.find(params[:procedure_id])
    @rule = @procedure.rules.find(params[:rule_id])
    @question = @rule.questions.find(params[:question_id])
  end

  def reply_params
    params.require(:reply).permit(:text, :from)
  end
end
