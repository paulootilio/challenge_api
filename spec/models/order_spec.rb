require 'rails_helper'

RSpec.describe Order, type: :model do
  context "Validade de uma Assinatura" do
    it "Assinatura válida?" do
      order = Order.new(
        device_model: "Modelo Teste",
        device_imei: "T200T",
        annual_price: 699.99,
        user_attributes: {
          name: "Paulo Teste",
          cpf: "123.456.789-99",
          email: "pauloteste@gmail.com"
        }
      )
      
      expect(order.valid?).to be_truthy
    end

    it "Assinatura inválida?" do
      order = Order.new
      order.device_model = "Modelo Teste"
      order.device_imei = "T200T"
      order.annual_price = nil
      
      expect(order.valid?).to be_falsey
    end

   
  end
end
