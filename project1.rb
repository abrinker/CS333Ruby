
=begin
Shows off Basic Ruby Stuff
=end

begin 
require './Die.rb'
rescue LoadError
	puts "LoadError: Die.rb was not found."
	exit
end

#My first test class in Ruby
class TestCode
	variable = "String"
	
	#Method that shows how scoping and variables work.
	def showScope
		#Show that the scope of variables are only within the class
		begin
			puts variable
		rescue
			puts "This method is out of the variables scope"
			variable = 4
		end
		
		var = "Hi"
		puts var
		#show more scope stuff
		for i in 0..2
			var = 2
			lel = 9
			puts var
		end
		puts var
		if true
			var = 3
		end
		puts var
		puts lel
	end
	
	#Quick method to show off built in binary search
	def builtinBinary
		arry = [1,2,3,4,5,6]
		num = arry.bsearch{|x| x==4}
		puts num
	end
		
	#Shows off the basic types (float, string, etc).
	def basicElements
	  variable = 4;
		#Print and Puts
		2.times {print "Print Hello World"}
		puts ""
		2.times {puts "Puts Hello World"}

		#Shows off string manipulation and to.___ methods
		text = "555"
		print text, " Has Type: #{text.class} \n"
		text = text.to_i
		print text, " Has Type: #{text.class} \n"
		text = text.to_f
		print text, " Has Type: #{text.class} \n"
		
		string = 'a'
		string += 'b'; puts string
		string = string*2
		puts string
		
		my_hash = {:x => ["Yay", 5, 5.5], :y => nil}
		print my_hash[:x],"\n"
		
		my_symbol = :whatisthis
		puts my_symbol
	end
	
	#its and awesome haiku
	def AwesomeHaiku
		if (a=0 > -2)
			puts "Haiku" end end
			
	puts variable
	
end

#Reference the built in array class and add a method to it
class Array
	#Assumes A sorted Array
	def binSearch(item, first=0, last = nil)
		last = self.size unless last
		choice = (first+last)/2
		# print "first: ", first, "\n"
# 		print "choice: ", choice, "\n"
# 		print "last: ", last, "\n\n"

		if (first == last && item != self[choice])
			return nil
		elsif item == self[choice]
			return item
		elsif item > self[choice]
			binSearch(item, choice+1, last)
		else
			binSearch(item, first, choice-1)
		end
	end
end


#Main Code
 tester = TestCode.new
 Dice = Die.new
 puts "Show Scope Things:"
 tester.showScope
 tester.basicElements
 puts "Show Binary Search Capabilities:"
 testArray = [1,2,3,4,5,6,7,8,9,10]
 puts testArray.binSearch(3)
 puts testArray.binSearch(20)
 puts "Let's run a Haiku:"
 tester.AwesomeHaiku
 puts "Let's use that built in Binary method:"
 tester.builtinBinary
 puts "Finally, let's roll a die from a class in another file:"
 Dice.roll
