# encoding: UTF-8
namespace :procedure do
  desc "Populate Values for Procedure"
  task :populate => :environment do
    procedure = Procedure.create( name: "Retirar carteira de identidade", description: "Este processo serve para informar sobre a retirada de carteira de motorista.")

    procedure.rules.new(description: "Entregar a certidao de nascimento.")
    procedure.rules.new(description: "Tirar a foto.")
    procedure.rules.new(description: "Tirar a impressao digital.")
    procedure.rules.new(description: "Entregar todos documentos do DETRAN.")
    procedure.rules.new(description: "Esperar 15 dias para retirar.")
    procedure.save
  end
end
