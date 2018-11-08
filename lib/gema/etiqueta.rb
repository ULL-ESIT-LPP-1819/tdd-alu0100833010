class Etiqueta
  attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos, :azucares, :proteinas, :sal

  def initialize(nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas, sal)
    @nombre, @grasas, @grasas_saturadas, @hidratos, @azucares, @proteinas, @sal = nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas, sal
  end

  def valor_kJ
    (@grasas*37)+(@hidratos*17)+(@proteinas*17)+(@sal*25)
  end
end
