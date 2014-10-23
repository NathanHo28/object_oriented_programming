class Person
	attr_accessor :name
	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi my name is #{name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object."
	end
end

instructor1 = Instructor.new("Chris")
instructor1.greeting

student1 = Student.new("Cristina")
student1.greeting

puts "Chris says:"
instructor1.teach
puts "Cristina says:"
student1.learn

# student1.teach => Undefined Method. .teach cannot be called on the 
# student instance as it does not inherit from the Instructor class.   