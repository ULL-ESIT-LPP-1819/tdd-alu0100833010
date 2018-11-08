class Etiqueta
  attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos, :azucares, :proteinas, :sal

  def initialize(nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas, sal)
    @nombre, @grasas, @grasas_saturadas, @hidratos, @azucares, @proteinas, @sal = nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas, sal
  end

  def valor_kJ
    (@grasas*37)+(@hidratos*17)+(@proteinas*17)+(@sal*25)
  end
  
  def valor_kcal
    (@grasas*9)+(@hidratos*4)+(@proteinas*4)+(@sal*6)
  end

  def grasa_IR
    (@grasas*100)/70
  end

  def grasa_saturada_IR
    (@grasas_saturadas*100)/20
  end

  def hidratos_IR
    (@hidratos*100)/260
  end
end
