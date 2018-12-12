require "./vending_machine"
require "pry"

items = {
  1 => {name: "Coke", price: 25 , quantity: 2},
  2 => {name: "Pepsi", price: 35, quantity: 2},
  3 => {name: "Sprite", price: 45, quantity: 2}
  }

v = VendingMachine.new(items)

while true do
  puts "This vending machine sells Coke, Pepsi, and Sprite."
  puts "Select 1 for Coke, 2 for Pepsi, or 3 for Sprite."
  @code = gets.chomp
  @items = items
  selection_valid = v.selection_valid?(@code.to_i)

  if @items[@code.to_i][:quantity] == 0
    selection_valid = false
    puts "#{@items[@code.to_i][:name]} is sold out. Please select again."
  end

  until selection_valid
    puts "Enter correct code"
    @code = gets.chomp

    if @items[@code.to_i][:quantity] == 0
      selection_valid = false
      puts "#{@items[@code.to_i][:name]} is sold out. Please select again."
    else
      selection_valid = v.selection_valid?(@code.to_i)
    end
  end

  v.show_price(@code.to_i)

  puts "Do you want to make this your selection? Y or N."
  answer = gets.chomp

  until answer == "Y" || answer == "y"
    puts "Select 1 for Coke, 2 for Pepsi, or 3 for Sprite."
    @code = gets.chomp

    selection_valid = v.selection_valid?(@code.to_i)

    until selection_valid
      puts "Enter correct code"
      @code = gets.chomp
      selection_valid = v.selection_valid?(@code.to_i)

      if @items[@code.to_i][:quantity] == 0
        selection_valid = false
        puts "#{@items[@code.to_i][:name]} is sold out. Please select again."
      else
        selection_valid = v.selection_valid?(@code.to_i)
      end
    end

    v.show_price(@code.to_i)
    puts "Do you want to make this your selection? Y or N."
    answer = gets.chomp
  end

  v.current_selection(@code.to_i)

  payment = gets.chomp.to_i

  until v.accept_payment(payment.to_i) == true
    payment = gets.chomp.to_i
  end

  item = items
  price = item[@code.to_i][:price]

  if payment >= price
    puts "You paid #{payment.to_i} cents. Press Y to vend, press N to refund."
    answer = gets.chomp
  else
    puts "You paid #{payment} cents, You owe #{(price) - (payment)}. Submit the rest of your payment."

    @first_payment = payment
    @additional_payment = gets.chomp.to_i

    until v.accept_payment(@additional_payment.to_i) == true
      @additional_payment = gets.chomp.to_i
    end

    @final_payment = (@first_payment + @additional_payment).to_i

    if @final_payment >= price
      puts "You paid #{@final_payment} cents. Press Y to vend, press N to refund."
    else
      puts "You paid #{@final_payment} cents, You owe #{(price) - (@final_payment)}. Submit the rest of your payment."

      @additional_payment2 = gets.chomp.to_i

        until v.accept_payment(@additional_payment2.to_i) == true
          @additional_payment2 = gets.chomp.to_i
        end

      @final_payment2 = (@first_payment + @additional_payment + @additional_payment2).to_i

      if @final_payment2 == price || @final_payment2 > price
        puts "You paid #{@final_payment2} cents. Press Y to vend, press N to refund."
      else
        answer = nil
        puts "Your order has been canceled due to too many attempts."
      end
    end
    answer = gets.chomp
  end

  if answer == "Y" || answer == "y"
    v.vend(@code.to_i, payment.to_i, @final_payment, @final_payment2)

    if @code == "1"
      puts "
      ..--------------------..
      |``--------------------''|
      |                        |
      |      ,,,;;;;;;,,,      |
      |   ,;;;;;;;;;;;;;;;;,   |
      |  ;;;;;;;;;;;;;;;;;;;;  |
      | ;;;;;;;;;;;;;;;;;;;;;; |
      |   _   _    _  _   ;;;; |
      |  (_  (_)  (_ (_)  ;;;; |
      | ;;;;;;;;;;;;;;;;;;;;;; |
      | :::..     ...::::::::: |
      |  ::::::::::::::::::::  |
      |   '::::::::::::::::'   |
      |      '''::::::'''      |
      |                        |
      |                        |
      ';----..............----;'
        '--------------------'"

    elsif @code == "2"
      puts "
      ..--------------------..
      |``--------------------''|
      |                        |
      |      ,,,;;;;;;,,,      |
      |   ,;;;;;;;;;;;;;;;;,   |
      |  ;;;;;;;;;;;;;;;;;;;;  |
      | ;;;;;;;;;'''  _  '';;; |
      |   _'''_  _   (_'  |  ' |
      |  |_) |_  |_) ._)  |    |
      | .|   |_  |     .....   |
      | :::..     ...::::::::: |
      |  ::::::::::::::::::::  |
      |   '::::::::::::::::'   |
      |      '''::::::'''      |
      |                        |
      |                        |
      ';----..............----;'
        '--------------------'"

    elsif @code == "3"
      puts "
      ..--------------------..
      |``--------------------''|
      |                        |
      |      ,,,;;;;;;,,,      |
      |   ,;;;;;;;;;;;;;;;;,   |
      |  ;;;;;;;;;;;;;;;;;;;;  |
      | ;;;;;;;;;;;;;;;;;;;;;; |
      | .......     .......... |
      | ;;;;;;   ;;;;;;;;;;;;; |
      | .......   ...........; |
      | :::::::::   '::::::::: |
      |  :::::      :::::::::  |
      |   '::::....'::::::::   |
      |      '''::::::'''      |
      |                        |
      |                        |
      ';----..............----;'
        '--------------------'"
    end
  else
    puts "Your payment has been refunded. Goodbye!"
  end
  v.item_balance(@code)

  if @items[1][:quantity] == 0 && @items[2][:quantity] == 0 && @items[3][:quantity] == 0
    puts "This vending machine is out of order. Please key in vendor code to restock."
    @vendor_code = gets.chomp.to_i

    if @vendor_code == 0
      puts "Enter Y to restock the vending machine."
    end

    @vendor_answer = gets.chomp

    if @vendor_answer == "y" || @vendor_answer == "Y"
      v.reset_machine(@vendor_answer)
      return false
    else
      puts "Vending Machine has not been restocked. Goodbye."
      return false
    end
  else
    true
  end
end
