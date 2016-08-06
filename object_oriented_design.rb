# class RuberRide
#   def initialize(type: :ruber_x, miles: 0)
#     @type = type
#     @miles = miles
#   end
#
#   def total_fare
#     base_fare + mileage_fare
#   end
#
#   def mileage_fare
#     if @type == :ruber_x
#       1.15 * @miles
#     elsif @type == :ruber_xl
#       2.0 * @miles
#     elsif @type == :ruber_select
#       2.75 * @miles
#     end
#   end
#
#   def base_fare
#     if @type == :ruber_x
#       2.0
#     elsif @type == :ruber_xl
#       3.0
#     elsif @type == :ruber_select
#       5.0
#     end
#   end
# end
#
# ride = RuberRide.new(type: :ruber_select, miles: 20)
# puts ride.total_fare

################################################################################
##########################  Polymorphism  ######################################
################################################################################

# class RuberRide
#   def initialize(miles: 0)
#     @miles = miles
#   end
#   def total_fare
#     base_fare + mileage_fare
#   end
#   def base_fare
#     2.0
#   end
#   def mileage_fare
#     1.15 * @miles
#   end
# end
#
# class Ruber_x < RuberRide
#   def base_fare
#     3.0
#   end
#   def mileage_fare
#     2.0 * @miles
#   end
# end
#
# class Ruber_xl < RuberRide
#   def base_fare
#     5.0
#   end
#   def mileage_fare
#     2.75 * @miles
#   end
# end
#
# class RuberSelect < RuberRide
#   def total_fare # super calls the total_fare instance from the superclass
#     super > 20.00 ? super : 20.00
#   end
#   def base_fare
#     5.0
#   end
#   def mileage_fare
#     2.75 * @miles
#   end
# end
#
# ride1 = RuberRide.new(miles: 20)
# puts ride1.total_fare
#
# ride2 = Ruber_x.new(miles: 20)
# puts ride2.total_fare
#
# ride3 = Ruber_xl.new(miles: 20)
# puts ride3.total_fare
#
# puts RuberRide.new(miles: 20).total_fare
# puts RuberRide.new(miles: 20).base_fare
# puts RuberRide.new(miles: 20).mileage_fare
#
# puts RuberSelect.new(miles: 4).total_fare

#######################################################################################
########    We have two classes responding differently to the same “message”,  ########
########    which is mileage_fare. Polymorphism!                               ########
#######################################################################################

class RuberRide
  def initialize(miles: 0, rate: 1.15, base_fare: 2.0, multiplier: 1.0)
    @miles = miles
    @rate = rate
    @base_fare = base_fare
    @multiplier = multiplier
  end
  def total_fare
    (@base_fare + mileage_fare) * @multiplier
  end
  def mileage_fare
    @rate * @miles
  end
end
class Ruber_x < RuberRide
  def initialize(miles: 0, rate: 2.0, base_fare: 3.0, multiplier: 1.0)
    super
  end
end
class Ruber_xl < RuberRide
  def initialize(miles: 0, rate: 2.75, base_fare: 5.0, multiplier: 1.0)
    super
  end
  def total_fare
    super > 20.0 ? super : 20.0
  end
end
#
# puts RuberRide.new(miles: 20).total_fare
# puts RuberRide.new(miles: 20, multiplier: 2.0).total_fare
# puts Ruber_x.new(miles: 20).mileage_fare
# puts Ruber_xl.new(miles: 2).total_fare
# puts Ruber_xl.new(miles: 50).total_fare
# puts Ruber_xl.new(miles: 50, multiplier: 2.0).total_fare


################################################################################
##########################   Duck Typing  ######################################
################################################################################

# class TaxiRide
#   def initialize(miles: 0)
#     @miles = miles
#   end
#   def total
#     @miles * 2.75
#   end
# end
#
# class AirportShuttle
#   def flat_rate_fare
#     40.00
#   end
# end
#
# class RuberRide
#   def initialize(miles: 0)
#     @miles = miles
#   end
#   def base_fare
#     2.0
#   end
#   def mileage_fare
#     @miles * 1.5
#   end
#   def total_fare
#     base_fare + mileage_fare
#   end
# end
#
# class Transaction
#   def initialize(purchase)
#     @purchase = purchase
#     puts "Processing Transaction..."
#   end
#
#   def print_receipt
#     if @purchase.is_a? AirportShuttle
#       puts "You bought a #{@purchase.class} for $#{@purchase.flat_rate_fare}"
#     elsif @purchase.is_a? TaxiRide
#       puts "You bought a #{@purchase.class} for $#{@purchase.total}"
#     else
#       puts "You bought a #{@purchase.class} for $#{@purchase.total_fare}"
#     end
#   end
# end
#
# purchases = [RuberRide.new(miles: 5), AirportShuttle.new, TaxiRide.new(miles: 17)]
#
# purchases.each do |purchase|
#   Transaction.new(purchase).print_receipt
# end


####################  refactor with Duck Typing  ###############################


# class Transaction
#   def initialize(purchase)
#     @purchase = purchase
#     puts "Processing Transaction..."
#   end
#   def print_receipt
#     if @purchase.respond_to? :total
#       puts "You bought a #{@purchase.class} for $#{@purchase.total}"
#     else
#       raise NotImplementedError,"Purchases must have a total method"
#     end
#   end
# end
#
# class TaxiRide
#   def initialize(miles: 0)
#     @miles = miles
#   end
#   def total
#     @miles * 2.75
#   end
# end
#
# class AirportShuttle
#   def total
#     40.00
#   end
# end
#
# class RuberRide
#   def initialize(miles: 0)
#     @miles = miles
#   end
#   def base_fare
#     2.0
#   end
#   def mileage_fare
#     @miles * 1.15
#   end
#   def total
#     base_fare + mileage_fare
#   end
# end
#
# purchases = [RuberRide.new(miles: 5), AirportShuttle.new, TaxiRide.new(miles: 17)]
#
# purchases.each do |purchase|
#   puts Transaction.new(purchase).print_receipt
# end
