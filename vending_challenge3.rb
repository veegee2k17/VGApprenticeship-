require "./vending_machine"
require "pry"

items = {
  001 => {name: "Coke", price: 25 },
  002 => {name: "Pepsi", price: 35 },
  003 => {name: "Sprite", price: 45}
  }

v = VendingMachine.new(items)

puts "This vending machine sells Coke, Pepsi, and Sprite."
puts "Select 001 for Coke, 002 for Pepsi, or 003 for Sprite."
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
  puts "Select 001 for Coke, 002 for Pepsi, or 003 for Sprite."
  code = gets.chomp

  selection_valid = v.selection_valid?(code.to_i)

  until selection_valid
    puts "Enter correct code"
    code = gets.chomp
    selection_valid = v.selection_valid?(code.to_i)
  end

  puts "Do you want to make this your selection? Y or N."
  answer = gets.chomp
end

v.current_selection(code.to_i)

payment = gets.chomp
v.accept_payment(payment.to_i)

puts "You paid #{payment} cents. Press Y to vend, press N to refund."
answer = gets.chomp

paid_in_full = v.paid_in_full?(payment.to_i)

until paid_in_full
  puts "Submit the rest of your payment"
  additional_payment = gets.chomp.to_i
  first_payment = payment.to_i
  binding.pry
  break if additional_payment + first_payment == price
end

if answer == "N" || answer == "n"
  puts "Your order has been canceled. Your payment of #{payment} cents has been refunded. Goodbye!"
else
  v.vend(code.to_i, payment.to_i)
end
