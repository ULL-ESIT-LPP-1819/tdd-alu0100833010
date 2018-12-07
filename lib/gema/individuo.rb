# encoding utf-8
# Author:: Sara Pérez Rodríguez (mailto:alu0100833010@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributes under the same term as Ruby
# Asignatura: Lenguajes y paradigmas de programación

# Módulo Individuo que incluye clases y métodos.
module Individuo

  # Clase Individuo con sus respectivos métodos y atributos.
  class Individuo

    # Atributos de la clase Individuo accesibles desde cualquier método de la clase.
    attr_accessor :n_historia, :nombre, :apellido, :edad, :sexo, :nacimiento, :ocupacion, :fumador

    # Incluímos el módulo comparable
    include Comparable
  
    # Método initialize para definir el objeto con los atributos.
    def initialize (n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador)
      @n_historia, @nombre, @apellido, @edad, @sexo, @nacimiento, @ocupacion, @fumador = n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador
    end

    # Método para mostrar el flujo de salida formateada.
    def to_s
      "[Número de historia=#{@n_historia}, Nombre=#{@nombre}, Apellido=#{@apellido}, Edad=#{@edad}, Sexo=#{@sexo}, Nacimiento=#{@nacimiento}, Ocupación=#{@ocupacion}, Fumador=#{@fumador}]:"
    end
    
    # Método para el correcto funcionamiento del módulo comparable.
    def <=>(other)
      return nil unless other.kind_of? Individuo
      @edad <=> other.edad
    end
  end

  # Clase Paciente que hereda de Individuo
  class Paciente < Individuo
    
    # Atributos de la clase paciente accesibles con cualquier método de la clase.
    attr_accessor :peso, :talla

    # Método initialize para definir el objeto con los atributos.
    def initialize (n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador, peso, talla, cintura, cadera, tricipital, bicipital, subescapular, suprailiaco)
      super(n_historia, nombre, apellido, edad, sexo, nacimiento, ocupacion, fumador)
      @peso, @talla, @cintura, @cadera, @tricipital, @bicipital, @subescapular, @suprailiaco = peso, talla, cintura, cadera, tricipital, bicipital, subescapular, suprailiaco
    end
 
    # Método para calcular el índice de masa corporal.
    def imc 
      @peso/(@talla*@talla)
    end

    # Método para calcular el porcentaje de masa.
    def masa
      1.2 * imc + 0.23 * @edad - 10.8 * @sexo - 5.4
    end

    # Método para calcular las medidas de la cintura.
    def cintura
      (@cintura[0]+@cintura[1])/2
    end

    # Método para calcular las medidas de la cadera.
    def cadera
      (@cadera[0]+@cadera[1])/2
    end

    # Método para calcular la relacion cintura-cadera.
    def rcc
      cintura/cadera
    end

    #Método para calcular el pliegue tricipital.
    def tricipital
      (@tricipital[0]+@tricipital[1]+@tricipital[2])/3
    end

    #Método para calcular el pliegue bicipital.
    def bicipital
      (@bicipital[0]+@bicipital[1]+@bicipital[2])/3
    end

    #Método para calcular el pliegue subescapular.
    def subescapular
      (@subescapular[0]+@subescapular[1]+@subescapular[2])/3
    end

    #Método para calcular el pliegue suprailiaco.
    def suprailiaco
      (@suprailiaco[0]+@suprailiaco[1]+@suprailiaco[2])/3
    end
 
    # Método para mostrar el flujo de salida formateado.
    def to_s
      "[Peso=#{@peso}, Talla=#{@talla}, IMC=#{imc}, %MC=#{masa}, RCC=#{rcc}, Pliegues=#{tricipital},#{bicipital},#{subescapular},#{suprailiaco}]:"
    end
  end
end
