class Etiqueta
  attr_reader :nombre, :grasas, :grasas_saturadas

  def initialize(nombre, grasas, grasas_saturadas)
    @nombre, @grasas, @grasas_saturadas = nombre, grasas, grasas_saturadas
  end
end
