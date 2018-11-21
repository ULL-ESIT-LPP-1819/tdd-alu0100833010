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
    end
  end

end
