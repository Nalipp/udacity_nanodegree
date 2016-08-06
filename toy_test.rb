require 'json'
require 'artii'
require 'date'

def setup
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$report_file = File.new("report.txt", "w+")
end

setup

def ascii(text, options = {}) # Print headings in ascii art
	a = Artii::Base.new
  puts a.asciify("#{text}")
	puts options[:space]
end

def date
  puts "Date : " + Date.today.strftime('%a %d %b %Y').to_s # Print today's date
	puts space_break
end

def space_break
  "*"*50
end

def start
  setup
  ascii("Sales Report") # Print "Sales Report" in ascii art
  date
  ascii("Products", space: space_break) # Print "Sales Report" in ascii art
  run_products_report
  ascii("Brands", space: space_break) # Print "Sales Report" in ascii art
	print_brands_report
end

################  Products  ##################

def run_products_report #Loops all items and passes them to the print_products
  $products_hash["items"].each do |item|
    print_products_report(item)
  end
end

def print_products_report(item) #Prints products
  puts "Item name        : " + item["title"]
  puts "Retail price     : " + item["full-price"]
  puts "Purchases        : " + item["purchases"].count.to_s
  puts "Total sales      : " + total_sales(item).to_s
  puts "Average price    : " + (total_sales(item) / item["purchases"].count).to_s
  puts "Average discount : " + '%.02f' %(item["full-price"].to_f - (total_sales(item) / item["purchases"].count)).to_s
  puts space_break
end

def total_sales(item)
  item["purchases"].map { |purchase| purchase["price"] }.reduce(:+)
end

################  Brands  ##################

def uniq_brands #Returns array of brands
	$products_hash["items"].map { |item| item["brand"] }.uniq
end

def brand_totals #Returns arrays of toy prices for each unique brand
	arr = []
	uniq_brands.each do |brand|
		arr2 = []
		$products_hash["items"].map do |item|
			if brand == item["brand"]
				arr2 << item["purchases"].map { |purchase| purchase["price"] }
			end
		end
		arr << arr2
	end
	arr
end

def brands_in_stock #Returns toys in stock by brand
	arr = []
	uniq_brands.each do |brand|
		tot = 0
		$products_hash["items"].map do |item|
			if brand == item["brand"] && item["stock"] != 0
				tot += 1
			end
		end
		arr << tot
	end
	arr
end

def print_brands_report
	count = 0
	uniq_brands.each do
		puts "Brand name            :" + uniq_brands[count]
		puts "Toys stocked by brand :" + brands_in_stock[count].to_s
		puts "Average price         :$" + (brand_totals[count].flatten.reduce(:+).round(2) / brand_totals[count].flatten.size ).to_s
		puts "Total sales           :$" + brand_totals[count].flatten.reduce(:+).round(2).to_s
		puts space_break
		count += 1
	end
end

start
