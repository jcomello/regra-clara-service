class QuestionsController < ApplicationController
  def index
    @procedure = Procedure.find(params[:procedure_id])
    @rule = @procedure.rules.find(params[:rule_id])

    @questions = @rule.questions
  end

  def create
    @procedure = Procedure.find(params[:procedure_id])
    @rule = @procedure.rules.find(params[:rule_id])

    @question = @rule.questions.new(question_params)

    if @procedure.save
      render json: @question
    else
      render :error
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :from)
  end
end
