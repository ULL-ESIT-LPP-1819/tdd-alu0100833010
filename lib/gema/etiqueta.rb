# encoding utf-8
# Author:: Sara Pérez Rodríguez (mailto:alu0100833010@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributes under the same term as Ruby
# Asignatura: Lenguajes y paradigmas de programación

# Módulo Etiqueta que incluye clases y sus métodos.
module Etiqueta
  
  # Clase Etiqueta que contiene sus atributos.
  class Etiqueta
    
    # Incluyendo módulo comparable.
    include Comparable  

    # Atributos de la clase accesibles por cualquier método.
    attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos, :azucares, :proteinas, :sal
 
    # Método initilize para definir los objetos con sus atributos.
    def initialize(nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas, sal, porcion)
      @nombre, @grasas, @grasas_saturadas, @hidratos, @azucares, @proteinas, @sal, @porcion = nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas, sal, porcion
    end

    # Método para calcular el Valor Energético en KiloJulios.
    def valor_kJ
      (@grasas*37)+(@hidratos*17)+(@proteinas*17)+(@sal*25)
    end
  
    # Método para calcular el Valor Energético en KiloCalorías.
    def valor_kcal
      (@grasas*9)+(@hidratos*4)+(@proteinas*4)+(@sal*6)
    end
 
    # Método para calcular la Ingesta Recomendada de grasa.
    def grasa_IR
      (@grasas*100)/70
    end

    # Método para calcular la Ingesta Recomendada de grasas saturadas.
    def grasa_saturada_IR
      (@grasas_saturadas*100)/20
    end

    # Método para calcular la Ingesta Recomendada de hidratos.
    def hidratos_IR
      (@hidratos*100)/260
    end

    # Método para calcular la Ingesta Recomendada de azúcar.
    def azucar_IR
      (@azucares*100)/90
    end

    # Método para calcular la Ingesta Recomendada de proteínas.
    def proteinas_IR
      (@proteinas*100)/50
    end

    # Método para calcular la Ingesta Recomendada de sal.
    def sal_IR
      (@sal*100)/6
    end
 
    # Método para mostrar el flujo de salida formateada.
    def to_s
      "[#{@nombre}, Grasas=#{@grasas}, Saturadas=#{@grasas_saturadas}, Hidratos=#{@hidratos}, Azúcares=#{@azucares}, Proteínas=#{@proteinas}, Sal=#{@sal}]:"
    end

    # Método para calcular el valor de una porción de grasas.
    def porcion
      (@grasas*30)/100     
    end
    
    # Método para el funcionamiento del módulo comparable.
    def <=>(other)
      valor_kJ <=> other.valor_kJ
    end
  end
end
