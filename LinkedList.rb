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
	
	#removes the ith element of the list
	def remove_index(i)
		if (!@head || @size < i+1) then return false end
		current = @head
		count = 0
		while (count < i) #got to the index
			current = current.get_next()
			count += 1
		end
		#special cases
		if (current == @head) then @head = @head.get_next() end
		if (current == @tail) then @tail = @tail.get_prev() end
		
		#update pointers
		if (current.get_prev()) then current.get_prev.set_next(current.get_next()) end
		if (current.get_next()) then current.get_next.set_prev(current.get_prev()) end
		
		@size -= 1
		return current.get_item()
	end
	
	#Gets the ith element of the list and returns it
	def get_index(i)
		if (!@head || @size < i+1)then return false end
		current = this.head
		count = 0
		while (count < i) #go to the index
			current = current.get_next()
			count+=1
		end
		return current.get_item()
	end
	
	#Returns a clone of the current list
	def clone()
		temp = LinkedList.new()
		current = @head
		while (current)
			temp.append(current.get_item())
			current = current.get_next()
		end
		return temp;
	end
	
	#Returns a shuffled version of the list
	def shuffle()
		if (!@head)then return false end
		temp = LinkedList.new()
		clone = self.clone()
		while (clone.get_size() > 0)
			temp.push(clone.remove_index(rand(clone.get_size())))
		end
		return temp;
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
	
	#determines whether or not all of the elements are the same type
	def is_compromised
		if (!@head) then return end
		type = @head.get_item().class
		current = @head
		while (current)
			if (!(current.get_item().is_a?(type))) then return true end
			current = current.get_next()
		end
		return false
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
	puts "Testing With Ints"
	list = LinkedList.new
	list.toString()
	
	#testing push
	puts "After Pushing 1"
	list.push(1)
	list.toString()
	
	puts "Popping..."
	puts list.pop()
	
	puts "\nShould be 1,2,3"
	list.append(2)
	list.push(1)
	list.append(3)
	list.toString()
	
	puts "Testing removing everything"
	list.remove(2)
	list.remove(1)
	list.remove(3)
	
	puts "Resetting the list"
	list.push(4)
	list.push(5)
	list.push(6)
	list.toString()
	
	#make the proc
	puts "After squaring"
	some_proc = Proc.new{|x| x*x}
	list.map(some_proc)
	list.toString()
	
	#testing clearing
	puts "Testing Clear"
	list.clear()
	list.toString()
end

#test function for strings
def list_strs
	puts "Testing With Strings"
	list = LinkedList.new
	list.toString()
	
	#testing push
	puts "After Pushing A"
	list.push("A")
	list.toString()
	
	puts "Popping..."
	puts list.pop()
	
	puts "\nShould be A,B,C"
	list.append("B")
	list.push("A")
	list.append("C")
	list.toString()
	
	puts "Testing removing everything"
	list.remove("B")
	list.remove("A")
	list.remove("C")
	
	puts "Resetting the list"
	list.push("D")
	list.push("E")
	list.push("F")
	list.toString()
	
	#make the proc
	puts "After Adding 'ED'"
	some_proc = Proc.new{|s| s+'ED'}
	list.map(some_proc)
	list.toString()
	
	#testing clearing
	list.clear()
	list.toString()
end

#test function for the is_compromised() method
def list_safety
	puts "Testing Compromise Check"
	list = LinkedList.new()
	list.append(2)
	list.push(1)
	puts "Is the List compromised? Should be false:"
	puts list.is_compromised()
	list.push("String")
	puts "After adding a string it should be true now:"
	puts list.is_compromised()
end

#test function for the remove_index() method
def list_remove_test
	puts "Testing the Remove index method"
	list = LinkedList.new()
	count = 9
	while (count >= 0)
		list.push(count)
		count -= 1
	end
	puts "After initialization:"
	list.toString()
	list.remove_index(9)
	list.remove_index(0)
	list.remove_index(3)
	puts "After removing 10th,1st, and 4th elements (9, 0, 4 should be gone)"
	list.toString()
	count = 10
	while (count > 0)
		list.remove_index(0)
		count -= 1
	end
	puts "After removing the 0th element a ton:"
	list.toString
end

#Test function for the shuffle() method
def list_shuffle_test
	puts "Testing Shuffling Capabilities"
	list = LinkedList.new();
	count = 10
	while (count >= 1)
		list.push(count);
		count-=1;
	end
	puts "After Initialization:"
	list.toString();
	list = list.shuffle();
	puts "After Shuffling:"
	list.toString();
	list = list.shuffle();
	puts "After Shuffling Again:"
	list.toString();
end

#Main Method	
#list_ints()
#list_strs()
#list_safety()
#list_remove_test()
list_shuffle_test()