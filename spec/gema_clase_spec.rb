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
end


