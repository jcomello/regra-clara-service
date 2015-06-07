require "rails_helper"

describe "Procedures" do
  let!(:procedures) { FactoryGirl.create_list(:procedure_full, 3) }

  context "index procedure" do
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

      expect(response.body).to include procedures.first.name
      expect(response.body).to include procedures.last.name
    end

    it "does not have non existent procedures" do
      get procedures_path

      expect(response.body).not_to include "Processo 79"
    end
  end

  context "show procedure" do
    let(:procedure) { procedures.first }

    it "responds a procedure with fields" do
      get procedure_path(procedure)

      expect(response.body).to include procedure.name
      expect(response.body).to include procedure.description
    end

    context "Comments" do
      # Cria comments no banco de dados com factorygirl
      let(:comments) { procedure.comments }

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
          post procedure_comments_path(procedure, comment: { text: "akjda", from: "Joao"})

          expect(response).to be_success
        end

        it "saves comment received" do
          post procedure_comments_path(procedure, comment: { text: "akjda", from: "Joao"})

          expect(response.body).to include "akjda"
          expect(response.body).to include "Joao"
        end
      end
    end

    context "Rules" do
      # Cria rules no banco de dados com factorygirl
      let(:rules) { procedure.rules }

      it "responds a procedure with rules" do
        # procedure_path(procedure) => criado ao adicionar uma rota
        get procedure_path(procedure)

        # Testa se a resposta inclui a description de cada rule
        expect(response.body).to include rules.first.description
        expect(response.body).to include rules.second.description
        expect(response.body).to include rules.last.description
      end

      context "Questions" do
        let(:rule) { rules.first }

        # Cria questions no banco de dados com factorygirl
        let(:questions) { rule.questions }

        it "responds a procedure with questions" do
          # procedure_path(procedure) => criado ao adicionar uma rota
          get procedure_path(procedure)

          # Testa se a resposta inclui a title de cada question
          expect(response.body).to include questions.first.title
          expect(response.body).to include questions.second.title
          expect(response.body).to include questions.last.title

          # Testa se a resposta inclui a from de cada from
          expect(response.body).to include questions.first.from
          expect(response.body).to include questions.second.from
          expect(response.body).to include questions.last.from

          # Testa se a resposta inclui a from de cada replies_count
          expect(response.body).to include questions.first.replies_count.to_s
          expect(response.body).to include questions.second.replies_count.to_s
          expect(response.body).to include questions.last.replies_count.to_s
        end

        it "responds a collection of questions" do
          get procedure_rules_all_questions_path(procedure, rule)

          expect(response.body).to include questions.first.title
          expect(response.body).to include questions.second.title
          expect(response.body).to include questions.last.title

          expect(response.body).to include questions.first.replies_count.to_s
          expect(response.body).to include questions.second.replies_count.to_s
          expect(response.body).to include questions.last.replies_count.to_s
        end

        context "receive questions" do
          it "receive question" do
            post procedure_rules_questions_path(procedure, rule, question: { title: "akjda", from: "Joao"})

            expect(response).to be_success
          end

          it "return question" do
            post procedure_rules_questions_path(procedure, rule, question: { title: "akjda", from: "Joao"})

            expect(response.body).to include "akjda"
            expect(response.body).to include "Joao"
          end
        end

        context "Replies" do
          let(:question) { questions.first }
          let(:replies) { question.replies }

          it "reponds a question with replies" do
            get procedure_path(procedure)

            expect(response.body).to include replies.first.text
            expect(response.body).to include replies.last.text

            expect(response.body).to include replies.first.from
            expect(response.body).to include replies.last.from
          end

          it "responds a collection of replies" do
            get procedure_rules_questions_all_replies_path(procedure, rule, question)

            expect(response.body).to include replies.first.text
            expect(response.body).to include replies.second.text
            expect(response.body).to include replies.last.text
          end

          context "receive replies" do
            it "receive reply" do
              post procedure_rules_questions_replies_path(procedure, rule, question, reply: { text: "Resposta correta", from: "Joao"})

              expect(response).to be_success
            end

            it "return question" do
              post procedure_rules_questions_replies_path(procedure, rule, question, reply: { text: "resoista correta", from: "Joao"})

              expect(response.body).to include "resoista correta"
              expect(response.body).to include "Joao"
            end
          end
        end
      end
    end
  end
end
