class Etiqueta
  attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos, :azucares

  def initialize(nombre, grasas, grasas_saturadas, hidratos, azucares)
    @nombre, @grasas, @grasas_saturadas, @hidratos, @azucares = nombre, grasas, grasas_saturadas, hidratos, azucares
  end
end
