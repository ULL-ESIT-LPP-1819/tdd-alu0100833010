# encoding utf-8
# Author:: Sara Pérez Rodríguez (mailto:alu0100833010@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributes under the same term as Ruby
# Asignatura: Lenguajes y paradigmas de programación

# Estructura de datos Node, con un valor, un nodo previo y siguiente.
Node = Struct.new(:value, :next, :prev)

# Módulo que incluye clases y sus métodos.
module Lista

  # Clase lista con head, tail y size.
  class Lista

    # Atributos de la clase Lista accesibles desde cualquier método.
    attr_accessor :head, :tail, :size
    
    # Incluímos el modulo enumerable.
    include Enumerable

    # Método initialize para definir un objeto Lista con sus atributos.
    def initialize()
      @head = Node.new(nil, nil, nil)
      @tail = Node.new(nil, nil, nil)
      @size = 0
    end
 
    # Método para saber si la lista está o no vacía.
    def empty?()
      if (@size == 0)
        return true
      else
        return false
      end
    end

    # Método para insertar valores en la lista.
    def push_elemento(valor)
      if (@size == 0)
        elemento = Node.new(valor, nil, nil)
        @tail = elemento
        @head = elemento
        @size += 1
        return @tail.value
      else
        elemento = Node.new(valor, nil, @tail)
        @tail.next = elemento
        elemento.prev = @tail
        @tail = elemento
        @size += 1
        return @tail.value
      end
    end

    # Método para extraer valores de la lista.
    def pop_elemento()
      if (@size == 0)
        puts "Lista vacía. No hay nodos para extraer."
      elsif (@size == 1) 
        elemento = @head
        valor = @head.value
        @head = nil
        @head = @tail
        @value = nil
        elemento.next = nil
        elemento.prev = nil
        @size -= 1
      else
        elemento = @head
        valor = @head.value
        @head = @head.next
        @head.prev = nil
        elemento.next = nil
        elemento.prev = nil
        @size -= 1
      end
      return valor
    end
   
    # Método para utilizar otros métodos del módulo enumarable.
    def each(&block)
      ini = @head
      while (ini != nil)
        yield ini.value
        ini = ini.next
      end
    end

    def sort_for
      @aux = self.map { |x| x }
      for x in 0..@aux.length-1
        for y in 0..@aux.length-2-x
          if (@aux[y]>@aux[y+1])
            @aux[y], @aux[y+1] = @aux[y+1], @aux[y]
          end
        end
      end
      return @aux
    end

    def sort_each
      @aux = self.map { |x| x }
      @pos = 0
      @aux.each do |x|
        @pos = @pos + 1
        @aux[@pos..@aux.length-1] do |y|
          if (x>y)
            x,y = y,x
          end
        end
      end
    end

  end
end
