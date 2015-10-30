=begin
Creates A generic LinkedList class
for use in other files.
=end

#A LinkedList data structure for storing stuff
class LinkedList

#------------------------Linked List Class-------------------------#

	#initializes the Linked List class
	def initialize
		@size = 0
		@head = nil
		@tail = nil
	end
	
	#adds a node to the front of the list
	def push(data)
		temp = Node.new(data)
		if (!@head)
			@head = temp
			@tail = temp
		else
			temp.set_next(@head)
			@head.set_prev(temp)
			@head = temp
		end
		@size += 1
	end
	
	#removes the first node from the list
	def pop
		if (!@head) then return nil end
		temp = @head
		@head = @head.get_next()
		if (@head) then @head.set_prev(nil)
		else @tail = nil
		end
		@size -= 1
		return temp.get_item()
	end
	
	#appends a node to the end of a list
	def append(data)
		temp = Node.new(data)
		if (!@head)
			@head = temp
			@tail = temp
		else
			temp.set_prev(@tail)
			@tail.set_next(temp)
			@tail = temp
		end
		@size +=1
	end
	
	#removes the node whose data matches the given element
	def remove(target)
		if (!@head) then return false end
		current = @head
		while (current)
			if (current.get_item() == target) then break end
			current = current.get_next()
		end
		#special cases
		if (!current) then return false end
		if (current == @head) then @head = @head.get_next() end
		if (current == @tail) then @tail = @tail.get_prev() end
		
		#update pointers
		if (current.get_prev()) then current.get_prev.set_next(current.get_next()) end
		if (current.get_next()) then current.get_next.set_prev(current.get_prev()) end
		
		@size -= 1
		return current.get_item()
	end
	
	#returns everything but the size...yeah...sure
	def get_size
		return @size
	end
	
	#clears the list.
	def clear
		@head = nil
		@tail = nil
		@size = 0
	end
	
	#Applies the given function to every data value in the list
	def map(func)
		if (!@head) then return end
		current = @head
		while (current)
			current.alter(func)
			current = current.get_next()
		end
	end
	
	#prints out a lovely string of the list
	def toString
		if (!@head)
			puts "Empty List\n\n"
		else
			current = @head
			string = "Head->"
			while (current)
				string += current.get_item().to_s + "->"
				current = current.get_next()
			end
			string += "End\n\n"
			puts "List of Size: " +@size.to_s
			puts string
		end
	end

#--------------------------Node Class------------------------------#

	class Node
		def initialize(data)
			@item = data
			@next = nil
			@prev = nil
		end
		
		#applies the given function on the node's data
		def alter(func)
			@item = func.call(@item)
		end
		
		#set the next node
		def set_next(node)
			@next = node
		end
		
		#set the previous node
		def set_prev(node)
			@prev = node
		end
		
		#return the next node
		def get_next()
			return @next
		end
		
		#return the previous node
		def get_prev()
			return @prev
		end
		
		#return the item
		def get_item()
			return @item
		end
	end
end

#--------------------------Main Code------------------------------#

#test function for integers
def list_ints
	list = LinkedList.new
	list.toString()
	list.push(1)
	list.toString()
	puts list.pop()
	list.append(2)
	list.push(1)
	list.append(3)
	list.toString()
	list.remove(2)
	list.remove(1)
	list.remove(3)
	list.push(4)
	list.push(5)
	list.push(6)
	list.toString()
	
	#make the proc
	some_proc = Proc.new{|x| x*x}
	list.map(some_proc)
	list.toString()
end

#Main Method	
list_ints()
