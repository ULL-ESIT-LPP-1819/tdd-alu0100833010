class Individuo
  attr_accessor :n_historia, :nombre, :apellido, :edad, :sexo, :nacimiento, :ocupacion, :fumador
  
  def initialize (n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador)
    @n_historia, @nombre, @apellido, @edad, @sexo, @nacimiento, @ocupacion, @fumador = n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador
  end

  def to_s
    "[Número de historia=#{@n_historia}, Nombre=#{@nombre}, Apellido=#{@apellido}, Edad=#{@edad}, Sexo=#{@sexo}, Nacimiento=#{@nacimiento}, Ocupación=#{@ocupacion}, Fumador=#{@fumador}]:"
  end
end

class Paciente < Individuo
  attr_accessor :peso, :talla

  def initialize (n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador, peso, talla, cintura, cadera, tricipital, bicipital, subescapular, suprailiaco)
    super(n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador)
    @peso, @talla, @cintura, @cadera, @tricipital, @bicipital, @subescapular, @suprailiaco = peso, talla, cintura, cadera, tricipital, bicipital, subescapular, suprailiaco
  end
 
  def imc 
    @peso/(@talla*@talla)
  end

  def masa
    1.2 * imc + 0.23 * @edad - 10.8 * @sexo - 5.4
  end

  def cintura
    (@cintura[0]+@cintura[1])/2
  end

  def cadera
    (@cadera[0]+@cadera[1])/2
  end

  def rcc
    cintura/cadera
  end

  def tricipital
    (@tricipital[0]+@tricipital[1]+@tricipital[2])/3
  end

  def bicipital
    (@bicipital[0]+@bicipital[1]+@bicipital[2])/3
  end

  def subescapular
    (@subescapular[0]+@subescapular[1]+@subescapular[2])/3
  end

  def suprailiaco
    (@suprailiaco[0]+@suprailiaco[1]+@suprailiaco[2])/3
  end
 
  def to_s
    "[Peso=#{@peso}, Talla=#{@talla}, IMC=#{imc}, %MC=#{masa}, RCC=#{rcc}, Pliegues=#{tricipital},#{bicipital},#{subescapular},#{suprailiaco}]:"
  end  
end
