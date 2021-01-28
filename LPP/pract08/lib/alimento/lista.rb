# create a Struct with :value, :next and :prev
 Node = Struct.new(:value, :next, :prev)

 class List

	 include Enumerable


         attr_reader :tail, :head, :size

         def initialize

                 @tail=nil
                 @head=nil
		 @size=0

         end

	 def Head
		 return @head.value
	 end

	 def Tail
		 return @tail.value
	 end



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

         def Insert_elements_head(array)


		 array.each do|i|
			 n=Node.new(i)
			 @head.prev = n
			 n.next = @head
			 @head = n

		 end

		  @size=@size+array.length()



         end

         def Insert_elements_tail(array)


		 array.each do|i|
			 n=Node.new(i)
			 @tail.next = n
			 n.prev = @tail
			 @tail = n

		 end

		  @size=@size+array.length()

         end

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

	 def Remove_head

		 if !@head.nil?

			 @head = @head.next
			 @head.prev = nil
		 end

		  @size -= 1

	 end

	 def Remove_tail

		 if !@head.nil?

			 @tail = @tail.prev
			 @tail.next = nil
		 end

		  @size -=1

	 end

	 def Size
		 return @size
	 end

	 def Is_Empty

		 if @size==0
			 value = true
		 else
			 value = false
		 end

		 value
	 end

	 def each

                 n = @head
                 while !n.nil?
                         yield n.value
                         n = n.next


                 end

         end



 end

