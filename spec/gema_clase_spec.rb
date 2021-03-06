require "spec_helper"
require 'benchmark'

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
      @individuo1 = Individuo::Paciente.new(1, "Sara", "Pérez", 23, 0, "17/08/1995", "Estudiante", "No", 60.0, 1.64, 0.12,[67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo7 = Individuo::Paciente.new(7, "Ayrton", "Crespo", 20, 1, "20/01/1998", "Estudiante", "No", 80.0, 1.78, 0.54, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo8 = Individuo::Paciente.new(8, "Antonio", "Crespo", 23, 1, "20/01/1995", "Estudiante", "No", 80.0, 1.87, 0.27, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
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
    # Cambiado por práctica 11. Ya no es edad, ahora es gasto energético total.
    context "Módulo Comparable" do
      it "Pruebas para comparar la valoración nutricional entre dos individuos" do
        expect(@individuo7 < @individuo1).to be(false)
        expect(@individuo1 < @individuo7).to be(true)

        expect(@individuo7 > @individuo8).to be(true)
        expect(@individuo8 > @individuo7).to be(false)

        expect(@individuo1 == @individuo1).to be(true) 
        expect(@individuo1 == @individuo7).to be(false)

        expect(@individuo7 <= @individuo1).to be(false)
        expect(@individuo1 <= @individuo7).to be(true)

        expect(@individuo7 >= @individuo8).to be(true)
        expect(@individuo8 >= @individuo7).to be(false)
      end
    end
    # ------------------------------------------------------------------------. 
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
    # -------------------------------------------------------------------------------------------------------------- 
    context "Programación funcional. Expectativas para el menú dietético." do
      it "Existe un método para calcular el peso teórico ideal" do
        expect(@individuo1.peso_teorico_ideal).to eq(60.5)
        expect(@individuo7.peso_teorico_ideal).to eq(71)
        expect(@individuo8.peso_teorico_ideal).to eq(77.75)
      end
      it "Existe un método para calcular el gasto energético basal" do
        expect(@individuo1.gasto_energetico_basal).to eq(1349)
        expect(@individuo7.gasto_energetico_basal).to eq(1817.5)
        expect(@individuo8.gasto_energetico_basal).to eq(1858.8)
      end
      it "Existe un método para calcular el efecto termogeno" do
        expect(@individuo1.efecto_termogeno).to eq(134.9)
        expect(@individuo7.efecto_termogeno).to eq(181.8)
        expect(@individuo8.efecto_termogeno).to eq(185.9)
      end
      it "Existe un método para calcular el gasto de actividad física" do
        expect(@individuo1.gasto_actividad_fisica).to eq(161.9)
        expect(@individuo7.gasto_actividad_fisica).to eq(981.5)
        expect(@individuo8.gasto_actividad_fisica).to eq(501.9)
      end
      it "Existe un método para calcular el gasto energético total" do
        expect(@individuo1.gasto_energetico_total).to eq(1645.8)
        expect(@individuo7.gasto_energetico_total).to eq(2980.8)
        expect(@individuo8.gasto_energetico_total).to eq(2546.6)
      end
    end
    context "Programación funcional. Menú dietético." do
      before :all do
        @lata_de_atun = Etiqueta::Etiqueta.new("Lata de atún", 23.0, 2.7, 0.5, 0.5, 20.0, 0.40, [0])
        @cereales = Etiqueta::Etiqueta.new("Cereales", 0.8, 0.2, 82.0, 7.0, 8.0, 1.6, [0.24])
        @chocolatina = Etiqueta::Etiqueta.new("Chocolatina", 23.0, 2.1, 81.1, 6.0, 9.0, 1.2, [0])
        @lentejas = Etiqueta::Etiqueta.new("Lentejas", 23.5, 52.0, 1.4, 0, 2.0, 0.2, [0])
        @tomate_frito = Etiqueta::Etiqueta.new("Tomate frito", 1.0, 3.5, 0.2, 3.0, 3.4, 4.7, [0])
        @aceite = Etiqueta::Etiqueta.new("Aceite", 0.0, 0.2, 90.1, 3.4, 5.2, 1.5, [0])
        @leche = Etiqueta::Etiqueta.new("Leche", 3.3, 4.8, 3.2, 0.0, 1.0, 4.3, [0])
        @menu_dietetico1 = [@lata_de_atun, @tomate_frito]
        @menu_dietetico2 = [@cereales, @chocolatina, @leche]
        @menu_dietetico3 = [@lentejas, @aceite]
        @menu_dietetico4 = [@lentejas, @tomate_frito, @lata_de_atun]
        @menu_dietetico5 = [@leche, @lentejas, @chocolatina]
      end
      it "Menú dietético 1. Cubre las exigencias calóricas del paciente." do
        calorias_menu = @menu_dietetico1.map{ |i| i.valor_kJ}
        total_calorias = calorias_menu.reduce(:+)
        gasto_energetico = @individuo1.gasto_energetico_total
        gasto_energetico = gasto_energetico * 0.10
        expect(total_calorias >= gasto_energetico).to eq(true)
      end
      it "Menú dietético 2. Cubre las exigencias calóricas del paciente." do
        calorias_menu = @menu_dietetico2.map{ |i| i.valor_kJ}
        total_calorias = calorias_menu.reduce(:+)
        gasto_energetico = @individuo7.gasto_energetico_total
        gasto_energetico = gasto_energetico * 0.10
        expect(total_calorias >= gasto_energetico).to eq(true)
      end
      it "Menú dietético 3. Cubre las exigencias calóricas del paciente." do
        calorias_menu = @menu_dietetico3.collect{ |x| x.valor_kJ}
        total_calorias = calorias_menu.reduce(:+)
        gasto_energetico = @individuo8.gasto_energetico_total
        gasto_energetico = gasto_energetico * 0.10
        expect(total_calorias >= gasto_energetico).to eq(true)
      end
      it "Menú dietético 4. Cubre las exigencias calóricas del paciente." do
        calorias_menu = @menu_dietetico4.collect{ |x| x.valor_kJ}
        total_calorias = calorias_menu.reduce(:+)
        gasto_energetico = @individuo1.gasto_energetico_total
        gasto_energetico = gasto_energetico * 0.10
        expect(total_calorias >= gasto_energetico).to eq(true)
      end
      it "Menú dietético 5. Cubre las exigencias calóricas del paciente." do
        menu_dietetico6 = @menu_dietetico1.zip(@menu_dietetico2)
        calorias_menu = menu_dietetico6.collect { |x, index| x.valor_kJ }
        total_calorias = calorias_menu.reduce(:+) 
        gasto_energetico = @individuo7.gasto_energetico_total
        gasto_energetico = gasto_energetico * 0.10
        expect(total_calorias >= gasto_energetico).to eq(true)
      end
    end
    # --------------------------------------------------------------------------------------------------------------
  end
  describe Lista::Lista do
    before :all do
      @lista = Lista::Lista.new()
      @individuo2 = Individuo::Paciente.new(2, "Sara", "Pérez", 23, 0, "17/08/1995", "Estudiante", "No", 60.0, 1.64, 0.0, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo3 = Individuo::Paciente.new(3, "María", "García", 33, 0, "13/01/1985", "Profesora", "Si", 110, 1.67, 0.12,[83.4,83.8], [105.1,105.6], [1.5,2.8,1.9], [1.6,1.2,1.9], [1.1,2.9,1.3], [1.6,2.2,2.2])
      @individuo4 = Individuo::Paciente.new(4, "Juan", "Castro", 53, 1, "04/10/1965", "Ingeniero", "No", 83, 1.78, 0.27, [68.7,69.0], [71.5,71.3], [1.4,2.6,1.7], [1.8,1.1,1.6], [2.4,1.1,2.6], [2.2,1.8,1.3])
      @individuo5 = Individuo::Paciente.new(5, "Lorena", "Rodríguez", 22, 0, "12/05/1996", "Estudiante", "Si", 47, 1.61, 0.54, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @individuo6 = Individuo::Paciente.new(6, "Carlos", "Coello", 13, 1, "15/06/2005", "Estudiante", "No", 58, 1.68, 0.12, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
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

    # Cambiado por práctica 11. Ya no es edad, ahora es gasto energético total.
    context "Módulo Enumerable" do
      it "Existe una lista vacía" do
        expect(@lista.empty?).to eq(true)
      end

      it "Función Collect" do
        @lista.push_elemento(@individuo2)
        @lista.push_elemento(@individuo6)
        @lista.push_elemento(@individuo4)
        expect(@lista.collect { |i| i }).to eq([@individuo2,@individuo6,@individuo4])
      end
      it "Función Select" do
        expect(@lista.select { |i| i.edad.round % 2 == 0 }).to eq([])
      end
      it "Función Sort" do
        expect(@lista.sort).to eq([@individuo2,@individuo6,@individuo4])
      end
      it "Función Min" do
        expect(@lista.min).to eq(@individuo2)
      end
      it "Función Max" do
        expect(@lista.max).to eq(@individuo4)
      end
    end
    # -------------------------------------------------------------------------.
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
  # Práctica 11. --------------------------------------------------------------------------------------------------------------------
  describe Etiqueta::Etiqueta do
    before :all do
      @array = []
      @lata_de_atun = Etiqueta::Etiqueta.new("Lata de atún", 23.0, 2.7, 0.5, 0.5, 20.0, 0.40, [0])
      @cereales = Etiqueta::Etiqueta.new("Cereales", 0.8, 0.2, 82.0, 7.0, 8.0, 1.6, [0.24])
      @chocolatina = Etiqueta::Etiqueta.new("Chocolatina", 23.0, 2.1, 81.1, 6.0, 9.0, 1.2, [0])
      @lentejas = Etiqueta::Etiqueta.new("Lentejas", 23.5, 52.0, 1.4, 0, 2.0, 0.2, [0])
      @tomate_frito = Etiqueta::Etiqueta.new("Tomate frito", 1.0, 3.5, 0.2, 3.0, 3.4, 4.7, [0])
      @aceite = Etiqueta::Etiqueta.new("Aceite", 0.0, 0.2, 90.1, 3.4, 5.2, 1.5, [0])
      @leche = Etiqueta::Etiqueta.new("Leche", 3.3, 4.8, 3.2, 0.0, 1.0, 4.3, [0])

      @menu_dietetico1 = [@lata_de_atun, @tomate_frito]
      @menu_dietetico2 = [@cereales, @chocolatina, @leche]
      @menu_dietetico3 = [@lentejas, @aceite]
      @menu_dietetico4 = [@lentejas, @tomate_frito, @lata_de_atun]
      @menu_dietetico5 = [@leche, @lentejas, @chocolatina]
      @menu_dietetico6 = [@lata_de_atun, @cereales]
      @menu_dietetico7 = [@cereales, @aceite, @leche]
      @menu_dietetico8 = [@tomate_frito, @aceite]
      @menu_dietetico9 = [@lentejas, @chocolatina, @lata_de_atun]
      @menu_dietetico10 = [@leche, @chocolatina]

      @array << @menu_dietetico1
      @array << @menu_dietetico2
      @array << @menu_dietetico3
      @array << @menu_dietetico4
      @array << @menu_dietetico5
      @array << @menu_dietetico6
      @array << @menu_dietetico7
      @array << @menu_dietetico8
      @array << @menu_dietetico9
      @array << @menu_dietetico10

      @list = Lista::Lista.new()
      @indi1 = Individuo::Paciente.new(21, "Sara", "Pérez", 23, 0, "17/08/1995", "Estudiante", "No", 60.0, 1.64, 0.0, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @indi2 = Individuo::Paciente.new(22, "María", "García", 33, 0, "13/01/1985", "Profesora", "Si", 110, 1.67, 0.12,[83.4,83.8], [105.1,105.6], [1.5,2.8,1.9], [1.6,1.2,1.9], [1.1,2.9,1.3], [1.6,2.2,2.2])
      @indi3 = Individuo::Paciente.new(23, "Juan", "Castro", 53, 1, "04/10/1965", "Ingeniero", "No", 83, 1.78, 0.27, [68.7,69.0], [71.5,71.3], [1.4,2.6,1.7], [1.8,1.1,1.6], [2.4,1.1,2.6], [2.2,1.8,1.3])
      @indi4 = Individuo::Paciente.new(24, "Lorena", "Rodríguez", 22, 0, "12/05/1996", "Estudiante", "Si", 47, 1.61, 0.54, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @indi5 = Individuo::Paciente.new(25, "Carlos", "Coello", 13, 1, "15/06/2005", "Estudiante", "No", 58, 1.68, 0.12, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @indi6 = Individuo::Paciente.new(26, "Petra", "Pérez", 32, 0, "17/08/1986", "Ingeniera", "No", 60.0, 1.64, 0.0, [67.6,68.1], [93.6,94.1], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @indi7 = Individuo::Paciente.new(27, "Laura", "García", 43, 0, "13/01/1975", "Floristera", "Si", 110, 1.67, 0.12,[83.4,83.8], [105.1,105.6], [1.5,2.8,1.9], [1.6,1.2,1.9], [1.1,2.9,1.3], [1.6,2.2,2.2])
      @indi8 = Individuo::Paciente.new(28, "Manolo", "Castro", 73, 1, "04/10/1945", "Jubilado", "No", 83, 1.78, 0.27, [68.7,69.0], [71.5,71.3], [1.4,2.6,1.7], [1.8,1.1,1.6], [2.4,1.1,2.6], [2.2,1.8,1.3])
      @indi9 = Individuo::Paciente.new(29, "Carolina", "Rodríguez", 15, 0, "12/05/2003", "Estudiante", "Si", 47, 1.61, 0.54, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
      @indi10 = Individuo::Paciente.new(210, "Eduardo", "Coello", 26, 1, "15/06/1992", "Administrador", "No", 58, 1.68, 0.12, [60.0,60.9], [90.0,90.5], [1.2,2.2,1.3], [1.1,1.9,1.3], [1.4,2.1,1.6], [1.2,2.8,2.3])
    end
    context "Expectativas generales para la lista." do
      it "Existe una lista vacía" do
        expect(@list.empty?).to eq(true)
      end

      it "Existe un método para insertar elementos" do
        expect(@list.push_elemento(@indi1)).to eq(@indi1)
        expect(@list.push_elemento(@indi2)).to eq(@indi2)
        expect(@list.push_elemento(@indi3)).to eq(@indi3)
        expect(@list.push_elemento(@indi4)).to eq(@indi4)
        expect(@list.push_elemento(@indi5)).to eq(@indi5)
        expect(@list.push_elemento(@indi6)).to eq(@indi6)
        expect(@list.push_elemento(@indi7)).to eq(@indi7)
        expect(@list.push_elemento(@indi8)).to eq(@indi8)
        expect(@list.push_elemento(@indi9)).to eq(@indi9)
        expect(@list.push_elemento(@indi10)).to eq(@indi10)
      end
      
      it "La lista ya no es vacía" do
        expect(@list.empty?).to eq(false)
      end
    end
    context "Expectativas generales para el array." do
      it "Existe un array NO vacío" do
        expect(@array[0]).to eq(@menu_dietetico1)
        expect(@array[1]).to eq(@menu_dietetico2)
        expect(@array[2]).to eq(@menu_dietetico3)
        expect(@array[3]).to eq(@menu_dietetico4)
        expect(@array[4]).to eq(@menu_dietetico5)
        expect(@array[5]).to eq(@menu_dietetico6)
        expect(@array[6]).to eq(@menu_dietetico7)
        expect(@array[7]).to eq(@menu_dietetico8)
        expect(@array[8]).to eq(@menu_dietetico9)
        expect(@array[9]).to eq(@menu_dietetico10)
      end
    end
    context "Métodos para ordenar el array y la lista." do
      it "Existe un método para ordenar el array y la lista mediante sort." do
        expect(@array.sort).to eq([@menu_dietetico8, @menu_dietetico5, @menu_dietetico10, @menu_dietetico4, @menu_dietetico3, @menu_dietetico9, @menu_dietetico1, @menu_dietetico6, @menu_dietetico7, @menu_dietetico2])
        expect(@list.sort).to eq([@indi6, @indi1, @indi10, @indi5, @indi4, @indi9, @indi7, @indi8, @indi2, @indi3])
      end
      it "Existe un método para ordenar el array y la lista mediante for." do
        expect(@array.sort_for).to eq([@menu_dietetico8, @menu_dietetico5, @menu_dietetico10, @menu_dietetico4, @menu_dietetico3, @menu_dietetico9, @menu_dietetico1, @menu_dietetico6, @menu_dietetico7, @menu_dietetico2])
        expect(@list.sort_for).to eq([@indi6, @indi1, @indi10, @indi5, @indi4, @indi9, @indi7, @indi8, @indi2, @indi3])
      end
      it "Existe un método para ordenar el array y la lista mediante each." do
        expect(@array.sort_each).to eq([@menu_dietetico8, @menu_dietetico5, @menu_dietetico10, @menu_dietetico4, @menu_dietetico3, @menu_dietetico9, @menu_dietetico1, @menu_dietetico6, @menu_dietetico7, @menu_dietetico2])
       # expect(@list.sort_each).to eq([@indi6, @indi1, @indi10, @indi5, @indi4, @indi9, @indi7, @indi8, @indi2, @indi3])
      end
      it "Benchmark" do
        n = 1500
        Benchmark.bm do |x|
          x.report("sort:") {n.times{@array.sort}}
          x.report("sort_for:") {n.times{@array.sort_for}}
          x.report("sort_each:") {n.times{@array.sort_each}}
          x.report("sort:") {n.times{@list.sort}}
          x.report("sort_for:") {n.times{@list.sort_for}}
          x.report("sort_each:") {n.times{@list.sort_each}}
        end
      end
    end
  end
end

