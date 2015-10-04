=begin
Shows off Basic Ruby Stuff
=end

class TestCode
	variable = "String"
	
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
	
	def builtinBinary
		arry = [1,2,3,4,5,6]
		puts arry.bsearch{|x| x==4}
			
	end
		
		
	def basicElements
	  variable = 4;
		#Print and Puts
		2.times {print "Print Hello World"}
		puts ""
		2.times {puts "Puts Hello World"}

		#
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

	def AwesomeHaiku
		if (a=0 > -2)
			puts "Haiku" end end
			
	puts variable
	
end

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
 puts "Show Scope Things:"
 tester.showScope
 tester.basicElements
 testArray = [1,2,3,4,5,6,7,8,9,10]
 puts testArray.binSearch(3)
 puts testArray.binSearch(20)
 tester.AwesomeHaiku
 tester.builtinBinary
