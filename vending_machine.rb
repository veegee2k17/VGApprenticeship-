# You need to design a Vending Machine which:
#  Accepts coins of 1,5,10,25 Cents i.e. penny, nickel, dime, and quarter.
#  Allow user to select products Coke(25), Pepsi(35), Sprite(45)
#  Allow user to take refund by canceling the request.
#  Return selected product and remaining change if any
#  Allow reset operation for vending machine supplier
class VendingMachine

  def initialize(items)
    @items = items
  end

  def selection_valid?(code)
    @items.keys.include? code
  end

  def show_price(code)
    item = @items[code]
    puts "#{@items[code][:name]} costs #{@items[code][:price]} cents"
  end

  def current_selection(code)
    if @items.keys.include? code
      puts "You selected #{@items[code][:name]}. Please insert payment"
    else
      puts "Your selection is invalid"
    end
  end

  def accept_payment(payment)
    @payment = payment
  end

  def calculate_change(payment)
    price = @items[:price].to_i
    change = payment - price
  end

  def paid_in_full?(payment)
    payment = payment.to_i
    price = @items[:price]
    if @payment == price
      true
    else
      false
    end
  end

  def vend(code, payment)
    item = @items[code.to_i]
    @change = payment - item[:price].to_i

    unless payment >= item[:price].to_i
      puts "You paid #{payment} cents, You owe #{(payment - item[:price].to_i).abs}"
    else
      puts "Your #{item[:name]} has been dispensed, your change is #{change} cents."
    end
  end
end
