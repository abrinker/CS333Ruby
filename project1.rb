#Shows off Basic Ruby Stuff
class TestCode
	#Print and Puts
	2.times {print "Print Hello World"}
	puts ""
	2.times {puts "Puts Hellow World"}
	
	#
	text = "555"
	print text, "Has Type:", text.class, "\n"
	text = text.to_i
	print text, "Has Type:", text.class, "\n"
	puts text + 1
end


class Array
	#Assumes A sorted Array
   def binSearch(item, first=0, last = nil)
     last = self.size unless top;
     choice = (first+last)/2;
 
     return nil if first > last
 
     if item == self[choice]
       return item
     elsif term > self[mid]
       binSearch(item, choice+1, last)
     else
       binSearch(item, first, choice-1)
     end
   end
 end