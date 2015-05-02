require "rails_helper"

describe "Procedures" do
  let!(:procedures) { FactoryGirl.create_list(:procedure, 3) }

  it "respond success" do
    get procedures_path

    expect(response).to be_success
  end

  it "respond some procedures" do
    get procedures_path

    expect(response.body).to be_present
  end

  it "response has the correct procedures" do
    get procedures_path

    expect(response.body).to include "Processo 1"
    expect(response.body).to include "Processo 3"
  end

  it "response does not have non existent procedures" do
    get procedures_path

    expect(response.body).not_to include "Processo 79"
  end
end
