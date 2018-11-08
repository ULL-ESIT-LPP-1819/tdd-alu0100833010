class Etiqueta
  attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos, :azucares, :proteinas

  def initialize(nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas)
    @nombre, @grasas, @grasas_saturadas, @hidratos, @azucares, @proteinas = nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas
  end
end
