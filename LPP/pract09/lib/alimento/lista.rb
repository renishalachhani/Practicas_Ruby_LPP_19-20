# create a Struct with :value, :next and :prev
 Node = Struct.new(:value, :next, :prev)

 class List



#Se incluye el Modulo Enumerable

	 include Enumerable


         attr_reader :tail, :head, :size


#Inicializamod las variables

         def initialize

                 @tail=nil
                 @head=nil
		 @size=0

         end

#Metodo que devuelve el valor de head

	 def Head
		 return @head.value
	 end


#Metodo que devuelve el valor de head


	 def Tail
		 return @tail.value
	 end


#Metodo para insertar un nodo por tail

         def Insert_tail(val)

		 n = Node.new(val)
		 if @head.nil?
			 @head=@tail=n
		 else
			 @tail.next=n
			 n.prev=@tail
			 @tail = n
		 end

		 @size=@size+1


         end


#Metodo para insertar un nodo por head

         def Insert_head(val)
		 n=Node.new(val)

		 if @head.nil?
			 @head=@tail=n
		 else
			 @head.prev = n
			 n.next = @head
			 @head=n
		 end

		  @size=@size+1


         end


#Metodo para insertar un array de nodos en head

         def Insert_elements_head(array)


		 array.each do|i|
			 n=Node.new(i)
			 @head.prev = n
			 n.next = @head
			 @head = n

		 end

		  @size=@size+array.length()



         end


	 #Metodo para instar un array de nodos por tail

         def Insert_elements_tail(array)


		 array.each do|i|
			 n=Node.new(i)
			 @tail.next = n
			 n.prev = @tail
			 @tail = n

		 end

		  @size=@size+array.length()

         end


	 #Metodo para eliminar todos los nodos dentro de la lista

         def Remove_all


		while !@head.nil?

			 if @head.next.nil?
				 @head = @tail = nil
			 else
				 @head = @head.next
				 @head.prev = nil
			 end
		 end

		@size=0



         end


	 #Metodo para eliminar el nodo en head

	 def Remove_head

		 if !@head.nil?

			 @head = @head.next
			 @head.prev = nil
		 end

		  @size -= 1

	 end

	 #Metodo para eliminar el nodo en tail

	 def Remove_tail

		 if !@head.nil?

			 @tail = @tail.prev
			 @tail.next = nil
		 end

		  @size -=1

	 end

	 #Devuelve el tamaño de la lista

	 def Size
		 return @size
	 end

	 #Comprueba si la lista esta vacía o no

	 def Is_Empty

		 if @size==0
			 value = true
		 else
			 value = false
		 end

		 value
	 end

	 #Metodo eah para utilizar el modulo enumerable

	 def each

                 n = @head
                 while !n.nil?
                         yield n.value
                         n = n.next


                 end

         end



 end

