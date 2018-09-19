my_array=(1..30)

my_array.each do |n|

	if n % 3 == 0 && n % 5 == 0
		puts "Fizz Buzz"

		elsif n % 3 == 0
			puts "Fizz"

		elsif n % 5 == 0
			puts "Buzz"
	else
		puts "#{n}"  
	end
end