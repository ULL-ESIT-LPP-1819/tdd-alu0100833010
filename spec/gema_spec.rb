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
      @lata_de_atun = Etiqueta.new("Lata de atún", 23.0, 2.7)
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
    end
  end
end
