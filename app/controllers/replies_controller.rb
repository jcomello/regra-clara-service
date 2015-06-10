class RepliesController < ApplicationController
  before_action :find_parameters

  def index
    @replies = @question.replies.order_by(likes: :desc)
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

    if @procedure.save
      redirect_to procedure_rules_questions_all_replies_path(@procedure, @rule, @question)
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
