=begin
Shows off More Basic Ruby Stuff
=end

class Project4
	#Shows off Float and Integer methods
	def floatsAndInts
		integer = 2
		float = 2.0
		puts "Raws",integer, float
		
		puts "\nStrings",integer.to_s, float.to_s
		
		puts "Int and Float Math! (always in the form ii, if, ff)"
		puts "addition:", integer+integer, integer+float, float+float,"\n"
		puts "subtraction:", integer-integer, integer-float, float-float,"\n"
		puts "multiplication:", integer*integer,integer*float, float*float,"\n"
		puts "division:", integer/integer, integer/float, float/float,"\n"
		
		puts "\nto.i Methods on 1.3, 1.5, and 1.8"
		print 1.3.to_i,1.5.to_i,1.8.to_i,"\n"
		
		puts "\nRounding/Rationalizing .3"
		puts 0.3.round,0.3.rationalize
		
		puts "\nRounding/Rationalizing .5"
		puts 0.5.round,0.5.rationalize
		
		puts "\nRounding/Rationalizing .8"
		puts 0.8.round,0.8.rationalize
		
		puts "\nLoops"
		integer.times{|jer| puts jer}
		
		begin
			float.times{|fl| puts fl}
		rescue
			puts "Floats can't loop"
		end
  end

	def opPrec
		#should print out correct
		a = "this should happen first"*2
		if (6+10)/2**2+1 == 10/2 && a != "" 
			puts "Step 1 worked!"
			if 2<3.5 and 4>2
				puts "That's Cool!"
			end
		end
	end
	
	def conversion
		puts "Computing 1 + 2 with an integer first"
		begin
			puts (1+"2")
		rescue
			puts "Cannot implicitly convert String '2' to integer. Trying explicit"
			puts 1+"2".to_i
		end
		puts "Computing 1 + 2 with a string first"
		begin
			puts "2"+1
		rescue
			puts "Cannot implicitly convert int to String, trying explicit"
			puts "2"+1.to_s
		end
	end
	
	def aggregateTypes
		array = [1,2,3]
		puts "array", array, array[0] + array[1] + array[2]
		
		hash = {"one" => 1.0, "two" => 2.0, "three" => 3.0}
		puts "hash", hash, hash['one']+hash['two']+hash['three']
	end
	
end

proj = Project4.new
proj.floatsAndInts()
proj.opPrec()
proj.conversion()
proj.aggregateTypes()