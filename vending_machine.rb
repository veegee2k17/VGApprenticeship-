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
    puts "#{item[:name]} costs #{item[:price]} cents"
  end

  def current_selection(code)
    if @items.keys.include? code
      puts "You selected #{@items[code][:name]}. Please insert payment"
    end
  end

  def accept_payment(payment)
    @payment = payment
    coins = [1,5,10,25]

    if !coins.include? payment
      puts "Please submit valid payment type of 1, 5, 10, or 25 cents."
      false
    else
      true
    end
  end

  def calculate_change(payment)
    price = @items[:price].to_i
    change = payment - price
  end

  def vend(code, payment, final_payment, final_payment2)
    item = @items[code.to_i]
    price = item[:price].to_i

    if final_payment2 != nil
      change2 = final_payment - price
      puts "Your change is #{change2} cents."
    end

    if final_payment != nil
      change1 = final_payment - price
      puts "Your change is #{change1} cents."
    end
    puts "Your #{item[:name]} has been dispensed."
  end
end
