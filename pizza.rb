class Pizza

	attr_accessor :toppings, :delivery_time

	def initialize(toppings = [])
		@toppings = toppings << 'cheese'
	end

	def vegetarian?()
		if @toppings.find {|i| i.vegetarian} != 0
			return true
		else
			return false
		end
	end

	def add_topping(topping) 
		@toppings << topping
	end

	def deliver!
		@delivery_time = Time.now + (60*30)
		return @delivery_time
	end

	def late?
		t = Time.now
		if @delivery_time > t
			return false
		else
			return true
		end
	end

end

class Topping
	attr_accessor :name, :vegetarian

	def initialize(name, vegetarian: false)
		@name = name
		@vegetarian = vegetarian
	end
end