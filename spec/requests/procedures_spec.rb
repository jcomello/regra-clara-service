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

    context "Receive comment" do
      it "receive comment" do
        post procedure_new_comment_path(procedure, comment: { text: "akjda", from: "Joao"})

        expect(response).to be_success
      end

      it "saves comment received" do
        post procedure_new_comment_path(procedure, comment: { text: "akjda", from: "Joao"})

        expect(procedure.reload.comments.last.text).to eq('akjda')
        expect(procedure.reload.comments.last.from).to eq('Joao')
      end
    end
  end

  context "Questions" do
    # Cria questions no banco de dados com factorygirl
    let(:questions) { FactoryGirl.create_list(:question, 3) }

    before do
      # Adiciona questions para o processo a ser testado
      procedure.questions << questions
    end

    it "responds a procedure with questions" do
      # procedure_path(procedure) => criado ao adicionar uma rota
      get procedure_path(procedure)

      # Testa se a resposta inclui a title de cada question
      expect(response.body).to include questions.first.title
      expect(response.body).to include questions.second.title
      expect(response.body).to include questions.last.title

      # Testa se a resposta inclui a from de cada from
      expect(response.body).to include questions.first.title
      expect(response.body).to include questions.second.title
      expect(response.body).to include questions.last.title
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
