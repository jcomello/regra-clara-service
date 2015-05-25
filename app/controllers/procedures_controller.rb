class ProceduresController < ApplicationController
  def index
    render json: Procedure.all
  end

  def show
    render json: Procedure.find(params[:id])
  end
end
