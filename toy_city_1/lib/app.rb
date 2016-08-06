require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
puts "Date :" + " #{Time.now}"

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

	puts "*"*50

	item_gross = 0
	number_of_purchases = 0
	total_sales_amount = 0

	products_hash["items"].each do |item|
		full_price = item["full-price"]
		number_of_purchases = item["purchases"].length
		item_gross = item["purchases"].inject(0) { |result, purchase| result + purchase["price"]}

		average_price = item_gross / item["purchases"].length
		average_discount = full_price.to_f - average_price
		percent_discount = (average_discount / full_price.to_f) * 100
		# Print the name of the toy
		puts "Item Name        : #{item["title"]}" + "\n" +
		#Print the retail price of the toy
				 "Retail price     : $#{item["full-price"]}" + "\n" +
    #Calculate and print the total number of purchases
				 "Purchases        : #{number_of_purchases}" + "\n" +
		#Print gross sales per toy
				 "Total sales      : $#{item_gross}" + "\n" +
		#Calculate and print the average price the toy sold for
				 "Average price    : $#{average_price}" + "\n" +
		#Calculate and print the average discount (% or $) based off the average sales price
				 "Average discount : $#{'%.02f' % average_discount}" + "\n" +
				 "       (percent)   %#{'%.00f' % percent_discount}"
	  puts "*"*50
		item_gross = 0
	end

	total_purchases = 0

	products_hash["items"].each do |item|
		item["purchases"].each do |purchase|
			total_sales_amount += purchase["price"]
		end
		total_purchases += item["purchases"].length
	end
	# Calculate and print the total number of purchases
	puts "Total purchases : #{total_purchases}"
	# Calculate and print the total amount of sales
	puts "    Sales total : " + "#{total_sales_amount}"
	puts "*"*50

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts
	puts "*"*50

	brands = products_hash["items"].map { |item| item["brand"]}.uniq

	count = 0
	brand_gross = 0
	purchases_count = 0
	item_stock = 0

	brands.length.times.each do |brand|
		products_hash["items"].each do |item|
				if item["brand"] == brands[count]
					item["purchases"].each do |purchase|
					purchases_count += 1
					brand_gross += purchase["price"]
				end
				item_stock += item["stock"]
			end
		end

		average_brand_toy_price = brand_gross / purchases_count
#Print the name of the brand
		puts "Brand name      : #{brands[count]}" + "\n" +
#Count and print the number of the brand's toys we stock
				 "Toys in stock   : #{item_stock}" + "\n" +
#Calculate and print the average price of the brand's toys
		     "Average price   : $#{'%.02f' % average_brand_toy_price}" + "\n" +
#Calculate and print the total revenue of all the brand's toy sales combined
				 "Total sales     : $#{'%.02f' % brand_gross}"
		count += 1
		brand_gross = 0
		purchases_count = 0
	  item_brand_in_stock = []
		puts "*"*50
	end
