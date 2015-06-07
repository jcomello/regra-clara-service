# Procedure == Process
class ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
  end

  def show
    @procedure = Procedure.find(params[:id])
  end
end
