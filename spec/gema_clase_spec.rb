require "spec_helper"

RSpec.describe Individuo::Individuo do
  before :each do
    @individuo1 = Individuo::Individuo.new(1, "Sara", "Pérez", 23, 0, "17/08/1995", "Estudiante", "No")
    @individuo7 = Individuo::Individuo.new(7, "Ayrton", "Crespo", 23, 1, "20/01/1995", "Estudiante", "No") 
  end

  context "Expectativas iniciales" do
    it "Existe un método para obtener un Individuo formateado" do
      expect(@individuo1.to_s).to eq("[Número de historia=#{@individuo1.n_historia}, Nombre=#{@individuo1.nombre}, Apellido=#{@individuo1.apellido}, Edad=#{@individuo1.edad}, Sexo=#{@individuo1.sexo}, Nacimiento=#{@individuo1.nacimiento}, Ocupación=#{@individuo1.ocupacion}, Fumador=#{@individuo1.fumador}]:") 
    end
  end
  
  context "Pruebas para comprobar la clase de un objeto, el tipo de un objeto y su pertenecia a una jerarquı́a" do
    it "Existe un método para comprobar el tipo de objeto" do
      expect(@individuo1.instance_of? Individuo::Individuo).to eq(true)
      expect(@individuo1.instance_of? Object).not_to eq(true)
      expect(@individuo1.instance_of? BasicObject).not_to eq(true)
      expect(@individuo1).to respond_to(:n_historia, :nombre, :apellido, :edad, :sexo, :nacimiento, :ocupacion, :fumador)
      expect(@individuo1).to respond_to('to_s')
    end

    it "Existe un método para comprobar la clase de un objeto" do
      expect(@individuo1.class).to eq(Individuo::Individuo)
      expect(@individuo1.is_a? Individuo::Individuo).to eq(true)
    end

    it "Existe un método para comprobar la jerarquía de un objeto" do
      expect(@individuo1.kind_of? Individuo::Individuo).to eq(true)
      expect(@individuo1.kind_of? BasicObject).to eq(true)
      expect(@individuo1.kind_of? Object).to eq(true)
    end
  end

  describe Individuo::Paciente do 
    before :each do
      @individuo1 = Individuo::Paciente.new(1, "Sara", "Pérez", 23, 0, "17/08/1995", "Estudiante", "No", 60.0, 1.64, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo7 = Individuo::Paciente.new(7, "Ayrton", "Crespo", 20, 1, "20/01/1998", "Estudiante", "No", 80.0, 1.78, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo8 = Individuo::Paciente.new(8, "Antonio", "Crespo", 23, 1, "20/01/1995", "Estudiante", "No", 80.0, 1.78, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
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

     context "Módulo Comparable" do
      it "Pruebas para comparar la valoración nutricional entre dos individuos" do
        expect(@individuo7 < @individuo1).to be(true)
        expect(@individuo1 < @individuo7).to be(false)

        expect(@individuo7 > @individuo8).to be(false)
        expect(@individuo8 > @individuo7).to be(true)

        expect(@individuo1 == @individuo8).to be(true)
        expect(@individuo1 == @individuo7).to be(false)

        expect(@individuo7 <= @individuo1).to be(true)
        expect(@individuo1 <= @individuo7).to be(false)

        expect(@individuo7 >= @individuo8).to be(false)
        expect(@individuo8 >= @individuo7).to be(true)
      end
    end
      
    context "Pruebas para comprobar la clase de un objeto, el tipo de un objeto y su pertenecia a una jerarquı́a" do
      it "Existe un método para comprobar el tipo de objeto" do
        expect(@individuo1.instance_of? Individuo::Paciente).to eq(true)
        expect(@individuo1.instance_of? Object).not_to eq(true)
        expect(@individuo1.instance_of? BasicObject).not_to eq(true)
        expect(@individuo1).to respond_to(:n_historia, :nombre, :apellido, :edad, :sexo, :nacimiento, :ocupacion, :fumador, :peso, :talla, :cintura, :cadera, :tricipital, :bicipital, :subescapular, :suprailiaco)
        expect(@individuo1).to respond_to('to_s')
        expect(@individuo1).to respond_to('imc')
        expect(@individuo1).to respond_to('masa')
        expect(@individuo1).to respond_to('rcc')
      end

      it "Existe un método para comprobar la clase de un objeto" do
        expect(@individuo1.class).to eq(Individuo::Paciente)
        expect(@individuo1.is_a? Individuo::Individuo).to eq(true)
        expect(@individuo1.is_a? Individuo::Paciente).to eq(true)
      end

      it "Existe un método para comprobar la jerarquía de un objeto" do
        expect(@individuo1.kind_of? Individuo::Individuo).to eq(true)
        expect(@individuo1.kind_of? Individuo::Paciente).to eq(true)
        expect(@individuo1.kind_of? BasicObject).to eq(true)
        expect(@individuo1.kind_of? Object).to eq(true)
      end     
    end
  end
  describe Lista::Lista do
    before :all do
      @lista = Lista::Lista.new()
      @individuo2 = Individuo::Paciente.new(2, "Sara", "Pérez", 23, 0, "17/08/1995", "Estudiante", "No", 60.0, 1.64, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo3 = Individuo::Paciente.new(3, "María", "García", 33, 0, "13/01/1985", "Profesora", "Si", 110, 1.67, [83.4,83.8], [105.1,105.6], [1.5,2.8,1.9], [1.6,1.2,1.9], [1.1,2.9,1.3], [1.6,2.2,2.2])
      @individuo4 = Individuo::Paciente.new(4, "Juan", "Castro", 53, 1, "04/10/1965", "Ingeniero", "No", 83, 1.78, [68.7,69.0], [71.5,71.3], [1.4,2.6,1.7], [1.8,1.1,1.6], [2.4,1.1,2.6], [2.2,1.8,1.3])
      @individuo5 = Individuo::Paciente.new(5, "Lorena", "Rodríguez", 22, 0, "12/05/1996", "Estudiante", "Si", 47, 1.61, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo6 = Individuo::Paciente.new(6, "Carlos", "Coello", 13, 1, "15/06/2005", "Estudiante", "No", 58, 1.68, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
    end
    
    describe "Expectativas generales" do
      it "Existe una lista vacía" do
        expect(@lista.empty?).to eq(true)
      end

      it "Existe un método para insertar elementos" do
        expect(@lista.push_elemento(@individuo2)).to eq(@individuo2)
        expect(@lista.push_elemento(@individuo3)).to eq(@individuo3)
        expect(@lista.push_elemento(@individuo4)).to eq(@individuo4)
        expect(@lista.push_elemento(@individuo5)).to eq(@individuo5)
        expect(@lista.push_elemento(@individuo6)).to eq(@individuo6)
      end
      
      it "La lista ya no es vacía" do
        expect(@lista.empty?).to eq(false)
      end
      
      it "Head es el primer elemento insertado" do
        expect(@lista.head.value).to eq(@individuo2)
      end

      it "Tail es el último elemento insertado" do
        expect(@lista.tail.value).to eq(@individuo6)
      end
    end
    context "Clasificación de los pacientes según su IMC" do
     # it "Accediendo al IMC de los pacientes" do
       # expect(@lista.pop_elemento().imc).to eq(@individuo2.imc)
     # end
      it "Comprobando clasificación de la OMS" do
        expect(@lista.pop_elemento().imc).to be <= 25.0 #Peso adecuado. No recibe tratamiento.
        expect(@lista.pop_elemento().imc).to be >= 35.0 #Obesidad grado 2. Recibe tratamiento.
        expect(@lista.pop_elemento().imc).to be >= 25.0 #Sobrepeso. Recibe tratamiento.
        expect(@lista.pop_elemento().imc).to be <= 18.5 #Bajo peso. Recibe tratamiento.
        expect(@lista.pop_elemento().imc).to be <= 25.0 #Peso adecuado. No recibe tratamiento.
      end
    end

    context "Módulo Enumerable" do
      
    end
    context "Pruebas para comprobar la clase de un objeto, el tipo de un objeto y su pertenecia a una jerarquı́a" do
      it "Existe un método para comprobar el tipo de objeto" do
        expect(@lista.instance_of? Lista::Lista).to eq(true)
        expect(@lista.instance_of? Object).not_to eq(true)
        expect(@lista.instance_of? BasicObject).not_to eq(true)
        expect(@lista).to respond_to(:head, :tail, :size)
        expect(@lista).to respond_to('empty?')
        expect(@lista).to respond_to('push_elemento')
        expect(@lista).to respond_to('pop_elemento')
      end

      it "Existe un método para comprobar la clase de un objeto" do
        expect(@lista.class).to eq(Lista::Lista)
        expect(@lista.is_a? Lista::Lista).to eq(true)
      end

      it "Existe un método para comprobar la jerarquía de un objeto" do
        expect(@lista.kind_of? Lista::Lista).to eq(true)
        expect(@lista.kind_of? BasicObject).to eq(true)
        expect(@lista.kind_of? Object).to eq(true)
      end
    end
  end
  describe Etiqueta::Etiqueta do
    before :each do
      @lata_de_atun = Etiqueta::Etiqueta.new("Lata de atún", 23.0, 2.7, 0.5, 0.5, 20.0, 0.40, [0])
    end 
    context "Pruebas para comprobar la clase de un objeto, el tipo de un objeto y su pertenecia a una jerarquı́a" do
      it "Existe un método para comprobar el tipo de objeto" do
        expect(@lata_de_atun.instance_of? Etiqueta::Etiqueta).to eq(true)
        expect(@lata_de_atun.instance_of? Object).not_to eq(true)
        expect(@lata_de_atun.instance_of? BasicObject).not_to eq(true)
        expect(@lata_de_atun).to respond_to(:nombre, :grasas, :grasas_saturadas, :hidratos, :azucares, :proteinas, :sal)
        expect(@lata_de_atun).to respond_to('valor_kJ')
        expect(@lata_de_atun).to respond_to('valor_kcal')
        expect(@lata_de_atun).to respond_to('to_s')
      end

      it "Existe un método para comprobar la clase de un objeto" do
        expect(@lata_de_atun.class).to eq(Etiqueta::Etiqueta)
        expect(@lata_de_atun.is_a? Etiqueta::Etiqueta).to eq(true)
      end

      it "Existe un método para comprobar la jerarquía de un objeto" do
        expect(@lata_de_atun.kind_of? Etiqueta::Etiqueta).to eq(true)
        expect(@lata_de_atun.kind_of? BasicObject).to eq(true)
        expect(@lata_de_atun.kind_of? Object).to eq(true)
      end
    end
  end
end
