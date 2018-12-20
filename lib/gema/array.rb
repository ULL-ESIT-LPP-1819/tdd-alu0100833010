# encoding utf-8
# Author:: Sara Pérez Rodríguez (mailto:alu0100833010@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributes under the same term as Ruby
# Asignatura: Lenguajes y paradigmas de programación

# Clase Array con sus respectivos métodos.
class Array

  def sort_for
  	@aux = self
  	for x in 0..self.length-1
  	  for y in 0..length-2-x
  	  	if (@aux[y]>@aux[y+1])
  	  		@aux[y], @aux[y+1]=@aux[y+1], @aux[y]
  	  	end
  	  end
  	end
  	return @aux
  end
end