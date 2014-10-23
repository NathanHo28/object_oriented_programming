class Red_rover
	attr_accessor :x, :y, :direction
	def initialize(x, y, direction)
		@x = x
		@y = y
		@direction = direction
	end

	def move
		case @direction
		when "N"
			@Y +=1
		when "S"
			@Y -=1
		when "E"
			@X +=1
		when "W"
			@X -=1
		else 
			raise  "error in your move, tried to use #{@direction} which is invalid"
		end
	end

	def turn_left
		case @direction
		when "N"
			@direction = "W"
		when "E"
			@direction = "N"
		when "S"
			@direction = "E"
		when "W"
			@direction = "S"
		else 
			raise "there was an error in your turn_left function, #{@direction} (your direction) not good"
		end
	end

	def turn_right
			case @direction
			when "N"
				@direction = "E"
			when "E"
				@direction = "S"
			when "S"
				@direction = "W"
			when "W"
				@direction = "N"
			else 
				raise "there was an error in your turn_right function, #{@direction} (your direction) not good"
			end
		end				

	def turn (turn_direction)
		if turn_direction = "L" 
			turn_left
		elsif turn_direction = "R"
			turn_right
		else 
			raise "your turn function failed with input #{turn_direction}"
		end
	end

			
	def read_instruction
		instruction = gets.chomp
		instruction.upcase!
		instruction.each_char do |instruction|
			if instruction. = "M"
				move
			elsif instruction = "L" || instruction = "R"
				turn(direction)
			else
				puts "you have not input a valid instruction"
			end
		end
	end
end
			
			