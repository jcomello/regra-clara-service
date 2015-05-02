class ProceduresController < ApplicationController
  def index
    render json: Procedure.all
  end
end
