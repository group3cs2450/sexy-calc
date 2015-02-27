class Order < ActiveRecord::Base
	belongs_to :user
	validates :width, :depth, :height, :distance, :additional_slack, :starting_u, :ending_u, :racks_crossed, :racks_through, :aisles,  numericality: {greater_than_or_equal_to: 0}
	def pccs
		(width*0.3)*2
	end
	def rack_u_subtotal
		if racks_crossed == 0
			subtotal = ((starting_u-ending_u) *1.75).abs
		else
			subtotal = height-(starting_u*1.75)+height-(ending_u*1.75)
		end
		subtotal
	end
	def length_in_inch
		racks_crossed*width+racks_through*depth+aisles*distance+rack_u_subtotal+pccs+additional_slack

	end
	def feet 
		(length_in_inch/12).round(1)
	end
	def meters
		(feet/3.2808).round(1)
	end
	def copper_length
		copper = 0;
		lengths = [1, 3, 5, 7]
		10.step(100, 5).each{|y| lengths.push(y)}
		
		lengths.each {|x| 
			if feet <= x 
				copper = x
				return copper
			end
			
		

		}


	end
		def fiber_length
		fiber =0;
		lengths = [1, 3, 5, 7]
		10.step(100, 5).each{|y| lengths.push(y)}
		
		lengths.each {|x| 
			if meters <= x
				fiber = x
				return fiber
			end
			
		

		}

	end
end
