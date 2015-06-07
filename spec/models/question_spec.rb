require 'rails_helper'

describe Question do
  let(:procedure) { FactoryGirl.create(:procedure) }
  let(:rules) { FactoryGirl.build_list(:rule, 2) }
  let(:subject) { FactoryGirl.build(:question) }

  before do
    procedure.rules << rules
    procedure.rules.first.questions << subject
  end

  context "#count_replies" do
    before do
      allow(subject).to receive(:replies).and_return([])
    end

    context "when there is no replies" do
      it "returns the correct number of replies" do
        expect(subject.replies_count).to be 0
      end
    end

    context "when there is some replies" do
      let(:replies) { FactoryGirl.build_list(:reply, 3) }

      before do
        allow(subject).to receive(:replies).and_return(replies)
      end

      it "returns the correct number of replies" do
        expect(subject.replies_count).to be 3
      end
    end
  end
end
