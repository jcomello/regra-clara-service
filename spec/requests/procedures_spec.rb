require "rails_helper"

describe "Procedures" do
  let!(:procedures) { FactoryGirl.create_list(:procedure, 3) }
  let(:procedure) { procedures.first }

  it "respond success" do
    get procedures_path

    expect(response).to be_success
  end

  it "has some procedures" do
    get procedures_path

    expect(response.body).to be_present
  end

  it "has the correct procedures" do
    get procedures_path

    expect(response.body).to include "Processo 1"
    expect(response.body).to include "Processo 3"
  end

  it "does not have non existent procedures" do
    get procedures_path

    expect(response.body).not_to include "Processo 79"
  end

  context "Comments" do
    # Cria comments no banco de dados com factorygirl
    let(:comments) { FactoryGirl.create_list(:comment, 3) }

    before do
      # Adiciona comments para o processo a ser testado
      procedure.comments << comments
    end


    it "responds a procedure with comments" do
      # procedure_path(procedure) => criado ao adicionar uma rota
      get procedure_path(procedure)

      # Testa se a resposta inclui o text de cada comment
      expect(response.body).to include comments.first.text
      expect(response.body).to include comments.second.text
      expect(response.body).to include comments.last.text

      # Testa se a resposta inclui o from de cada comment
      expect(response.body).to include comments.first.from
      expect(response.body).to include comments.second.from
      expect(response.body).to include comments.last.from
    end
  end
  context "Rules" do
    # Cria rules no banco de dados com factorygirl
    let(:rules) { FactoryGirl.create_list(:rule, 3) }

    before do
      # Adiciona rule para o processo a ser testado
      procedure.rules << rules
    end

    it "responds a procedure with rules" do
      # procedure_path(procedure) => criado ao adicionar uma rota
      get procedure_path(procedure)

      # Testa se a resposta inclui a description de cada rule
      expect(response.body).to include rules.first.description
      expect(response.body).to include rules.second.description
      expect(response.body).to include rules.last.description
    end
  end
end
