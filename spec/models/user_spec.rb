require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validade de um Usuário" do
    it "Usuário válido?" do
      user = User.new
      user.name = "Paulo Teste"
      user.cpf = "123.456.789-99"
      user.email = "pauloteste@gmail.com"
      
      expect(user.valid?).to be_truthy
    end

    it "Usuário inválido?" do
      user = User.new
      user.name = "Paulo Teste"
      user.cpf = "123.456.789-99"
      user.email = nil
      
      expect(user.valid?).to be_falsey
    end
  end    
end
