class Individuo
  attr_accessor :n_historia, :nombre, :apellido, :edad, :sexo, :nacimiento, :ocupacion, :fumador
  
  def initialize (n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador)
    @n_historia, @nombre, @apellido, @edad, @sexo, @nacimiento, @ocupacion, @fumador = n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador
  end

end
