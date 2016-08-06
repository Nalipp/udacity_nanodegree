# def remove_dogs(arr)
#   arr.delete_if { |i| i == "dog"}
#   return arr
# end
#
# animals = ["cat", "kitty", "dog", "bunny", "walter", "dog", "parrot"]
# puts remove_dogs(animals)

# def bill_with_tip(subtotal, tip_percent = 18)
#   tip = subtotal * tip_percent / 100
#   subtotal + tip
# end
#
# puts bill_with_tip(100, 20)

def bill_with_tip(subtotal, options = {})
  tip = options[:tip] || 18
  tip = tip / 100.0

  if options[:discount]
    discount = (100 - options[:discount]) / 100.0
    subtotal = subtotal * discount
  end

  tip = subtotal * tip
  subtotal + tip
end

puts bill_with_tip 34, tip: 100, discount: 0

# def divisible_by_five(num)
#   num % 5 == 0
# end
#
# puts divisible_by_five(3)
