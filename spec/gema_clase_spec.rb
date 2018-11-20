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
end


