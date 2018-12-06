require "spec_helper"


RSpec.describe Gema do
  it "has a version number" do
    expect(Gema::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe Etiqueta::Etiqueta do
    before :all do
      @lata_de_atun = Etiqueta::Etiqueta.new("Lata de atún", 23.0, 2.7, 0.5, 0.5, 20.0, 0.40, [0])
      @cereales = Etiqueta::Etiqueta.new("Cereales", 0.8, 0.2, 82.0, 7.0, 8.0, 1.6, [0.24])
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

    context "Módulo Comparable" do
      it "Pruebas para comparar la información nutricional entre dos etiquetas" do
        expect(@lata_de_atun.grasas==@cereales.grasas).to be(false)
        expect(@lata_de_atun.grasas_saturadas>@cereales.grasas_saturadas).to be(true)
        expect(@lata_de_atun.hidratos<@cereales.hidratos).to be(true)
      end
      it "Alimentos con el mismo nombre" do
        expect(@lata_de_atun==@cereales).to be(false)
        expect(@cereales==@cereales).to be(true)
      end
    end
  end

  describe Lista::Lista do
    before :all do
      @lista = Lista::Lista.new()
      @lata_de_atun = Etiqueta::Etiqueta.new("Lata de atún", 23.0, 2.7, 0.5, 0.5, 20.0, 0.40, [0])
      @cereales = Etiqueta::Etiqueta.new("Cereales", 0.8, 0.2, 82.0, 7.0, 8.0, 1.6, [0.24])
      @chocolatina = Etiqueta::Etiqueta.new("Chocolatina", 23.0, 2.1, 81.1, 6.0, 9.0, 1.2, [0])
      @lentejas = Etiqueta::Etiqueta.new("Lentejas", 23.5, 52.0, 1.4, 0, 2.0, 0.2, [0])
      @tomate_frito = Etiqueta::Etiqueta.new("Tomate frito", 1.0, 3.5, 0.2, 3.0, 3.4, 4.7, [0])
      @aceite = Etiqueta::Etiqueta.new("Aceite", 0.0, 0.2, 90.1, 3.4, 5.2, 1.5, [0])
      @leche = Etiqueta::Etiqueta.new("Leche", 3.3, 4.8, 3.2, 0.0, 1.0, 4.3, [0])
    end
      
    context "Expectativas iniciales" do
      it "Existe una lista vacía" do
	expect(@lista.empty?).to eq(true)
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
        expect(@lista.push_elemento(@lata_de_atun)).to eq(@lata_de_atun)
        expect(@lista.push_elemento(@cereales)).to eq(@cereales)
        expect(@lista.push_elemento(@chocolatina)).to eq(@chocolatina)
        expect(@lista.push_elemento(@lentejas)).to eq(@lentejas)
        expect(@lista.push_elemento(@tomate_frito)).to eq(@tomate_frito)
        expect(@lista.push_elemento(@aceite)).to eq(@aceite)
        expect(@lista.push_elemento(@leche)).to eq(@leche)
      end

      it "Ya no existe una lista vacía" do
        expect(@lista.empty?).to eq(false)
      end 
 
      it "Head es el primer elemento insertado" do
        expect(@lista.head.value).to eq(@lata_de_atun)
      end

      it "Tail es el ultimo elemento insertado" do
        expect(@lista.tail.value).to eq(@leche)
      end
    end
    context "Extrayendo elementos" do
      it "Existe un método para extraer elementos" do
        expect(@lista.pop_elemento()).to eq(@lata_de_atun)
      end
    end

    context "Clasificación según los gramos de sal" do
      it "Accediendo a los gramos de sal" do
        expect(@lista.pop_elemento().sal).to eq(@cereales.sal)
      end

      it "Comprobar que los gramos de sal son recomendables" do
        expect(@lista.pop_elemento().sal).to be <= 6
        expect(@lista.pop_elemento().sal).to be <= 6
        expect(@lista.pop_elemento().sal).to be <= 6
        expect(@lista.pop_elemento().sal).to be <= 6
        expect(@lista.pop_elemento().sal).to be <= 6
      end
    end
    context "Módulo Enumerable" do
      it "Pruebas para enumerar listas de etiquetas" do
        expect(@lista.collect { |i| i }).to eq([@lata_de_atun,@cereales,@chocolatina,@lentejas,@tomate_frito,@aceite,@leche])
        expect(@lista.sort).to eq([@lata_de_atun,@cereales,@chocolatina,@lentejas,@tomate_frito,@aceite,@leche])
      end
    end
  end
end
