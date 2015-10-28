=begin
Creates A generic LinkedList class
for use in other files.
=end

#A LinkedList data structure for storing stuff
class LinkedList

#------------------------Linked List Class -------------------------#

	def initialize()
		@size = 0
		@head = nil;
		@tail = nil;
	end
	
	def push(data)
	
	def get_size
		return @size
	end

#--------------------------Node Class ------------------------------#

	class Node
		def initialize(data)
			@item = data
			@next = nil
			@prev = nil
		end
		
		def set_next(node)
			@next = node
		end
		
		def set_prev(node)
			@prev = nil
		end
	end
end

def main
	list = LinkedList.new
	puts list.get_size()
end

#Main Method	
main()