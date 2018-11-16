Node = Struct.new(:value, :next, :prev)

class Lista
  attr_accessor :head, :tail, :size
 
  def initialize()
    @head = Node.new(nil, nil, nil)
    @tail = Node.new(nil, nil, nil)
    @size = 0
  end
 
  def empty?()
    if (@size == 0)
      return true
    else
      return false
    end
  end

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
      return valor
    else
      elemento = @head
      valor = @head.value
      @head = @head.next
      @head.prev = nil
      elemento.next = nil
      elemento.prev = nil
      @size -= 1
      return valor
    end
  end

end
