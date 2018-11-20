class Individuo
  attr_accessor :n_historia, :nombre, :apellido, :edad, :sexo, :nacimiento, :ocupacion, :fumador
  
  def initialize (n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador)
    @n_historia, @nombre, @apellido, @edad, @sexo, @nacimiento, @ocupacion, @fumador = n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador
  end

  def to_s
    "[Número de historia=#{@n_historia}, Nombre=#{@nombre}, Apellido=#{@apellido}, Edad=#{@edad}, Sexo=#{@sexo}, Nacimiento=#{@nacimiento}, Ocupación=#{@ocupacion}, Fumador=#{@fumador}]:"
  end
end
