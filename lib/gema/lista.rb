Node = Struct.new(:value, :next, :prev)

class Lista
  attr_accessor :head, :tail, :size
 
  def initialize()
    @head = Node.new(nil, nil, nil)
    @tail = Node.new(nil, nil, nil)
    @size = 0
  end
 
  def empty()
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

  def extraer_head()
    if (@size == 0)
      puts "Lista vacía. No hay nodos para extraer."
    elsif (@size == 1)
      elemento = Node.new(@head.value, nil, nil)
      @tail = Node.new(nil, nil, nil)
      @head = Node.new(nil,nil, nil)
      @size -= 1
      return elemento.value
    elsif (@size > 1)
      elemento = Node.new(@head.value, nil, nil)
      @head.next.prev = nil
      @head = @tail.next
      @size -= 1
      return elemento.value
    end
  end

end
