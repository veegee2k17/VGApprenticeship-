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
    @item = @items[code]
    puts "#{@item[:name]} costs #{@item[:price]} cents"
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
    @price = @items[:price].to_i
    @change = @payment - @price
  end

  def vend(code, payment, final_payment, final_payment2)
    @item = @items[code.to_i]
    @price = @item[:price].to_i
    @quantity = @items[code.to_i][:quantity]

    # Vending item
    if @item[:quantity] == 0
      puts "#{@item[:name]} is out of stock. Your payment has been refunded."
    else
      puts "Your #{@item[:name]} has been dispensed."
      @item[:quantity] -= 1
    end

    if final_payment2 != nil && final_payment2 > @price
      change2 = final_payment2 - @price
      puts "Your change is #{change2} cents."
    elsif
      final_payment != nil && final_payment > @price
      change1 = final_payment - @price
      puts "Your change is #{change1} cents."
    end
  end

  # Print remaining balance
  def item_balance(code)
    if @item[:quantity] == 1
      puts "There is #{@item[:quantity]} #{@item[:name]} left."
    else
      puts "There are #{@item[:quantity]} #{@item[:name]}s left."
    end
  end


  # Reset machine
  def reset_machine(vendor_answer)
    @items[1][:quantity] += 2
    @items[2][:quantity] += 2
    @items[3][:quantity] += 2
    puts "The vending machine has been restocked. Your current inventory is #{@items[1][:quantity]} #{@items[1][:name]}s, #{@items[2][:quantity]} #{@items[2][:name]}s, and #{@items[3][:quantity]} #{@items[3][:name]}s."
  end
end
