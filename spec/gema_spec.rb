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
      @lata_de_atun = Etiqueta.new("Lata de atún", 23.0, 2.7, 0.5, 0.5, 20.0, 0.40, [0])
      @cereales = Etiqueta.new("Cereales", 0.8, 0.2, 82.0, 7.0, 8.0, 1.6, [0.24]) 
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
      it "Ingesta recomendada para la grasa total" do			# El porcentaje de grasas está por debajo de la IR
        expect(@lata_de_atun.grasa_IR).to eq((23.0*100)/70)
      end

      it "Ingesta recomendada para las grasas saturadas" do		# El porcentaje de grasas saturadas está por debajo de la IR
        expect(@lata_de_atun.grasa_saturada_IR).to eq((2.7*100)/20)
      end

      it "Ingesta recomendada para los hidratos de carbono" do		# El porcentaje de hidratos de carbono está por debajo de la IR
        expect(@lata_de_atun.hidratos_IR).to eq((0.5*100)/260)
      end

      it "Ingesta recomendada para los azúcares" do			# El porcentaje de azúcares está por debajo de la IR
        expect(@lata_de_atun.azucar_IR).to eq((0.5*100)/90)
      end

      it "Ingesta recomendada para las proteínas" do			# El porcentaje de proteínas está por debajo de la IR
        expect(@lata_de_atun.proteinas_IR).to eq((20.0*100)/50)
      end
	
      it "Ingesta recomendada para la sal" do				# El porcentaje de sal está por debajo de la IR
        expect(@lata_de_atun.sal_IR).to eq((0.40*100)/6)
      end
    end

    context "Etiqueta formateada" do
      it "Existe un método para obtener la etiqueta formateada" do
        expect(@lata_de_atun.to_s).to eq("[#{@lata_de_atun.nombre}, Grasas=#{@lata_de_atun.grasas}, Saturadas=#{@lata_de_atun.grasas_saturadas}, Hidratos=#{@lata_de_atun.hidratos}, Azúcares=#{@lata_de_atun.azucares}, Proteínas=#{@lata_de_atun.proteinas}, Sal=#{@lata_de_atun.sal}]:")
      end
    end

    context "Cálculo de expectativas iniciales por porción" do
      it "Gramos por porción para las grasas" do
        expect(@cereales.porcion).to eq(0.24)
      end
    end
  end

  describe Lista do
    before :all do
      @lista = Lista.new()
    end
      
    context "Expectativas iniciales" do
      it "Existe una lista vacía" do
	expect(@lista.empty).to eq(true)
      end

      it "Existe un valor para head nulo" do
        expect(@lista.head.value).to eq(nil)
      end

      it "Existe un valor para tail nulo" do
        expect(@lista.tail.value).to eq(nil)
      end

      it "Existe un tamaño para la lista igual a 0" do
        expect(@lista.size).to eq(0)
      end
    end
    
    context "Insertando elementos" do
      it "Existen los nodos prev y next vacíos" do
        expect(@lista.head.next).to eq(nil)
        expect(@lista.tail.prev).to eq(nil)
      end

      it "Existe un método para insertar elementos" do
        @lista.insertar_tail(@lata_de_atun)
        expect(@lista.size).to eq(1)
      end
    end
  end
end
