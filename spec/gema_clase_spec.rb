require "spec_helper"

RSpec.describe Individuo do
  before :each do
    @individuo1 = Individuo.new(1, "Sara", "Pérez", 23, 0, "17/08/1995", "Estudiante", "No") 
  end

  context "Expectativas iniciales" do
    it "Existe un método para obtener un Individuo formateado" do
      expect(@individuo1.to_s).to eq("[Número de historia=#{@individuo1.n_historia}, Nombre=#{@individuo1.nombre}, Apellido=#{@individuo1.apellido}, Edad=#{@individuo1.edad}, Sexo=#{@individuo1.sexo}, Nacimiento=#{@individuo1.nacimiento}, Ocupación=#{@individuo1.ocupacion}, Fumador=#{@individuo1.fumador}]:") 
    end
  end
  
  context "Pruebas para comprobar la clase de un objeto, el tipo de un objeto y su pertenecia a una jerarquı́a" do
    it "Existe un método para comprobar el tipo de objeto" do
      expect(@individuo1.instance_of? Individuo).to eq(true)
    end

    it "Existe un método para comprobar la clase de un objeto" do
      expect(@individuo1.class).to eq(Individuo)
      expect(@individuo1.is_a? Individuo).to eq(true)
    end

    it "Existe un método para comprobar la jerarquía de un objeto" do
      expect(@individuo1.kind_of? Individuo).to eq(true)
      expect(@individuo1.kind_of? BasicObject).to eq(true)
      expect(@individuo1.kind_of? Object).to eq(true)
    end
  end

  describe Paciente do 
    before :each do
      @individuo1 = Paciente.new(1, "Sara", "Pérez", 23, 0, "17/08/1995", "Estudiante", "No", 60.0, 1.64, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
    end

    context "Expectativas iniciales" do   
      it "Existe un método para obtener el IMC del individuo" do
        expect(@individuo1.imc).to eq(60.0/(1.64*1.64))
      end

      it "Existe un método para obtener el % de masa corporal" do
        expect(@individuo1.masa).to eq(1.2*@individuo1.imc+0.23*23-10.8*0-5.4)
      end
      
      it "Existe un método para obtener la RCC" do
        expect(@individuo1.rcc).to eq(((67.6+68.1)/2)/((93.6+94.1)/2))
      end
      
      it "Existe un método para calcular el valor bicipital, tricipital, subescapular y suprailiaco" do
        expect(@individuo1.tricipital).to eq((1.2+2.2+1.3)/3)
        expect(@individuo1.bicipital).to eq((1.1+1.9+1.3)/3)
        expect(@individuo1.subescapular).to eq((1.4+2.1+1.6)/3)
        expect(@individuo1.suprailiaco).to eq((1.2+2.8+2.3)/3)
      end

      it "Existe un método para obtener un Paciente formateado" do
          expect(@individuo1.to_s).to eq("[Peso=#{@individuo1.peso}, Talla=#{@individuo1.talla}, IMC=#{@individuo1.imc}, %MC=#{@individuo1.masa}, RCC=#{@individuo1.rcc}, Pliegues=#{@individuo1.tricipital},#{@individuo1.bicipital},#{@individuo1.subescapular},#{@individuo1.suprailiaco}]:")  
      end
    end
      
    context "Pruebas para comprobar la clase de un objeto, el tipo de un objeto y su pertenecia a una jerarquı́a" do
      it "Existe un método para comprobar el tipo de objeto" do
        expect(@individuo1.instance_of? Paciente).to eq(true)
      end

      it "Existe un método para comprobar la clase de un objeto" do
        expect(@individuo1.class).to eq(Paciente)
        expect(@individuo1.is_a? Individuo).to eq(true)
        expect(@individuo1.is_a? Paciente).to eq(true)
      end

      it "Existe un método para comprobar la jerarquía de un objeto" do
        expect(@individuo1.kind_of? Individuo).to eq(true)
        expect(@individuo1.kind_of? Paciente).to eq(true)
        expect(@individuo1.kind_of? BasicObject).to eq(true)
        expect(@individuo1.kind_of? Object).to eq(true)
      end
    end
  end
  describe Lista do
    before :each do
      @lista_p = Lista.new()
      @individuo1 = Paciente.new(1, "Sara", "Pérez", 23, 0, "17/08/1995", "Estudiante", "No", 60.0, 1.64, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo2 = Paciente.new(2, "María", "García", 33, 0, "13/01/1985", "Profesora", "Si", 110, 1.67, [83.4,83.8], [105.1,105.6], [1.5,2.8,1.9], [1.6,1.2,1.9], [1.1,2.9,1.3], [1.6,2.2,2.2])
      @individuo3 = Paciente.new(3, "Juan", "Castro", 53, 1, "04/10/1965", "Ingeniero", "No", 83, 1.78, [68.7,69.0], [71.5,71.3], [1.4,2.6,1.7], [1.8,1.1,1.6], [2.4,1.1,2.6], [2.2,1.8,1.3])
      @individuo4 = Paciente.new(4, "Lorena", "Rodríguez", 22, 0, "12/05/1996", "Estudiante", "Si", 47, 1.61, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo5 = Paciente.new(5, "Carlos", "Coello", 13, 1, "15/06/2005", "Estudiante", "No", 58, 1.68, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
    end
    
    it "Existe una lista vacía" do
      expect(@lista_p.empty?).to eq(true)
    end

    it "Existe un valor para head nulo" do
      expect(@lista_p.head.value).to eq(nil)
    end

    it "Existe un valor para tail nulo" do
      expect(@lista_p.tail.value).to eq(nil)
    end

    it "Existe un tamaño para la lista igual a 0" do
      expect(@lista_p.size).to eq(0)
    end   
    
    context "Insertando elementos" do
      it "Existen los nodos prev y next vacíos" do
        expect(@lista_p.head.next).to eq(nil)
        expect(@lista_p.tail.prev).to eq(nil)
      end
      
      it "Existe un método para insertar elementos" do
        expect(@lista_p.push_elemento(@individuo2)).to eq(@individuo2)
      end
      it "Ya no existe una lista vacía" do
        expect(@lista_p.empty?).to eq(false)
      end 
    end
  end
end
