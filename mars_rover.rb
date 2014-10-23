#We were almost finished and Chris found us.
#Chris is a really cool TA and helped us go to the next level

class Rover
	attr_accessor :x, :y, :direction, :world_width, :world_height
	def initialize(x, y)
		@world_width = x
		@world_height = y
	end

	def set_position(x, y, direction)
		@x = x
		@y = y
		@direction = direction
	end


	def move
		case @direction
		when "N"
			@y +=1
		when "S"
			@y -=1
		when "E"
			@x +=1
		when "W"
			@x -=1
		else 
			raise  "error in your move, tried to use #{@direction} which is invalid"
		end
		#sanity check to make sure it's in-bounds
		@y = [@y, world_height].min
		@y = [@y, 0].max
		@x = [@x, world_width].min
		@x = [@x, 0].max
		#pacman code can go here. use of modular %.
	end

	def turn(direction)
		d = @direction.tr("NESW", "0123").to_i
		if direction == "L"
			d = (d-1) % 4
		elsif direction == "R"
			d = (d+1) % 4 #4 because there's 4 directions
		else 
			raise "your direction is neither L or R it is #{direction}"
		end
		@direction = d.to_s.tr("0123", "NESW")
	end

	# def turn_left
	# 	case @direction
	# 	when "N"
	# 		@direction = "W"
	# 	when "E"
	# 		@direction = "N"
	# 	when "S"
	# 		@direction = "E"
	# 	when "W"
	# 		@direction = "S"
	# 	else 
	# 		raise "there was an error in your turn_left function, #{@direction} (your direction) not good"
	# 	end
	# end

	# def turn_right
	# 	case @direction

	# 	when "N"
	# 		@direction = "E"
	# 	when "E"
	# 		@direction = "S"
	# 	when "S"
	# 		@direction = "W"
	# 	when "W"
	# 		@direction = "N"
	# 	else 
	# 		raise "there was an error in your turn_right function, #{@direction} (your direction) not good"
	# 	end
	# end		

	def position
		"#{x} #{y} #{direction}"
	end
			
	def read_instruction(instruction)
		# puts "enter a series of commands in the form of M and L for the Rover"
		# instruction = gets.chomp
		# instruction.upcase!
		# instruction.each_char do |instruction|
			case instruction
			when "M"
				move
			when "L", "R"
				turn(instruction)
			# when "R"
			# 	turn_right
			else 
				raise "invalid instruction #{instruction} in read_instruction"
			end
	end
end

def prompt
		line = gets
		exit if (line.nil? || line.strip.empty?)
		line.strip
end

puts "Please enter the world size"
world_height, world_width = gets.chomp.split(" ").map { |s| s.to_i }
mars_rover = Rover.new(world_width, world_height)
loop do
	puts "enter the starting position of the rover or type quit to quit"
	x, y, direction = prompt.split(" ")
	x = x.to_i
	y = y.to_i
	mars_rover.set_position(x, y, direction)
	puts "enter rover commands pls"
	instructions = prompt.upcase
	instructions.each_char do |character|
		mars_rover.read_instruction(character)
		end
	puts "#{mars_rover.position}"
end