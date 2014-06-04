require './pizza'

describe Pizza do
  it "exists" do
    expect(Pizza).to be_a(Class)
  end

  describe '.initialize' do
    it 'records all of the toppings' do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]

      pizza = Pizza.new(toppings)

      expect(pizza.toppings).to eq(toppings) 
    end
  end

  describe 'vegetarian?' do
    it 'tells you whether the pizza is vegetarian' do
      toppings = [ Topping.new('mushrooms', vegetarian: true)]

      pizza = Pizza.new(toppings)

      expect(pizza.vegetarian?).to eq(true)
    end
  end

  describe 'add_topping' do
    it 'adds a topping to the pizza' do
      pizza = Pizza.new()

      expect(pizza.toppings).to eq(['cheese'])

      topping = Topping.new('peppers')

      pizza.add_topping(topping)

      expect(pizza.toppings).to eq(['cheese', topping])
    end
  end

  describe 'deliver!' do
    it 'sets a delivery time 30min from now' do
      pizza = Pizza.new
      pizza.deliver!
      now = (Time.now + (60*30)).min
      expect(pizza.delivery_time.min).to eq(now)
    end
  end

  describe 'late?' do
    it 'tells you if the delivery is running late' do
      pizza = Pizza.new()
      pizza.deliver!

      expect(pizza.late?).to eq(false)
    end
  end

end

describe Topping do
  it "exists" do
    expect(Topping).to be_a(Class)
  end

  describe '.initialize' do
  	it "sets the name of the topping" do
  		topping = Topping.new('olives')
  		expect(topping.name).to eq('olives')
    end

    it "sets whether or not the topping is vegetarian" do
      topping = Topping.new('bell peppers', vegetarian: true)
      expect(topping.vegetarian).to eq(true)    
  	end

  end
end

