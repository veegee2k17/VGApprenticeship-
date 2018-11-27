require "./vending_machine"
require "pry"

items = {
  1 => {name: "Coke", price: 25 },
  2 => {name: "Pepsi", price: 35 },
  3 => {name: "Sprite", price: 45}
  }

v = VendingMachine.new(items)

puts "This vending machine sells Coke, Pepsi, and Sprite."
puts "Select 1 for Coke, 2 for Pepsi, or 3 for Sprite."
code = gets.chomp

selection_valid = v.selection_valid?(code.to_i)

until selection_valid
  puts "Enter correct code"
  code = gets.chomp
  selection_valid = v.selection_valid?(code.to_i)
end

v.show_price(code.to_i)

puts "Do you want to make this your selection? Y or N."
answer = gets.chomp

until answer == "Y" || answer == "y"
  puts "Select 1 for Coke, 2 for Pepsi, or 3 for Sprite."
  code = gets.chomp

  selection_valid = v.selection_valid?(code.to_i)

  until selection_valid
    puts "Enter correct code"
    code = gets.chomp
    selection_valid = v.selection_valid?(code.to_i)
  end
  v.show_price(code.to_i)
  puts "Do you want to make this your selection? Y or N."
  answer = gets.chomp
end

v.current_selection(code.to_i)

payment = gets.chomp.to_i
v.accept_payment(payment.to_i)

item = items
price = item[code.to_i][:price]

if payment >= price
  puts "You paid #{payment.to_i} cents. Press Y to vend, press N to refund."
else
  puts "You paid #{payment} cents, You owe #{(price) - (payment)}. Submit the rest of your payment."

  first_payment = payment
  additional_payment = gets.chomp.to_i
  final_payment = (first_payment + additional_payment).to_i

  if final_payment == price
    puts "You paid #{final_payment} cents. Press Y to vend, press N to refund."
  else
    puts "You paid #{final_payment} cents, You owe #{(price) - (final_payment)}. Submit the rest of your payment."
  end
end
answer = gets.chomp

if answer == "Y" || answer == "y"
  v.vend(code.to_i, payment.to_i)
else
  puts "Your order has been canceled. Your payment of #{payment} cents has been refunded. Goodbye!"
end
