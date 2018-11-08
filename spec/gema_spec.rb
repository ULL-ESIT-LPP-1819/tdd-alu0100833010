require "spec_helper"

RSpec.describe Gema do
  it "has a version number" do
    expect(Gema::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe Etiqueta do
    before :all do
      @lata_de_atun = Etiqueta.new("Lata de atún", 23.0, 2.7, 0.5, 0.5, 20.0, 0.40)
    end

    context "Expectativas iniciales" do
      it "Existe un nombre para la etiqueta" do
	expect(@lata_de_atun.nombre).to eq("Lata de atún")
      end

      it "Existe la cantidad de grasas" do
        expect(@lata_de_atun.grasas).to eq(23.0)
      end

      it "Existe la cantidad de grasas saturadas" do
        expect(@lata_de_atun.grasas_saturadas).to eq(2.7)
      end

      it "Existe la cantidad de hidratos de carbono" do
        expect(@lata_de_atun.hidratos).to eq(0.5)
      end

      it "Existe la cantidad de azúcares" do
        expect(@lata_de_atun.azucares).to eq(0.5)
      end

      it "Existe la cantidad de proteínas" do
        expect(@lata_de_atun.proteinas).to eq(20.0)
      end

      it "Existe la cantidad de sal" do
        expect(@lata_de_atun.sal).to eq(0.40)
      end
    end

    context "Cálculo del valor energético" do
      it "Cálculo del valor energético en kJ/g" do
        expect(@lata_de_atun.valor_kJ).to eq((23.0*37)+(0.5*17)+(20.0*17)+(0.40*25))
      end

      it "Cálculo del valor energético en kcal/g" do
        expect(@lata_de_atun.valor_kcal).to eq((23.0*9)+(0.5*4)+(20.0*4)+(0.40*6))
      end
    end

    context "Cálculo de la Ingesta Recomendada" do
      it "Ingesta recomendada para la grasa total" do
        expect(@lata_de_atun.grasa_IR).to eq((23.0*100)/70)
      end

      it "Ingesta recomendada para las grasas saturadas" do
        expect(@lata_de_atun.grasa_saturada_IR).to eq((2.7*100)/20)
      end
    end
  end
end
