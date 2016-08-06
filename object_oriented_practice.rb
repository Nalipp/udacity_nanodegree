# class Customer
#   attr_reader :funds
#
#   def initialize(funds, password)
#     @funds = funds
#     @password = password
#   end
#
#   def withdraw_securely(amount, password)
#     if password == @password
#       remove_funds(amount)
#     else
#       puts "incorect password"
#     end
#   end
#
#   private
#
#   def remove_funds(amount)
#     @funds -= amount
#   end
# end
#
# class Employee
#   @@bank = "Udacity International Bank"
#
#   def bank
#     @@bank
#   end
# end

# class Customer
#   attr_accessor :id
#
#   @@id = 1
#   @@customers = []
#
#   def initialize
#     @id = @@id
#     @@id += 1
#     @@customers << self
#   end
#
#   def self.all  #call with Customer.all
#     @@customers
#   end
# end
#
# class InvalidPasswordError < StandardError
# end
#
# class Employee
#   attr_accessor :vacation_days
#
#   def initialize(password)
#     @vacation_days = 20
#     @password = password
#   end
#
#   def get_paid
#     puts "you recieved payment"
#   end
#
#   def vacation_pass(days, password)
#     if password == @password
#       take_vacation(days)
#     else
#       raise InvalidPasswordError, " '#{password}' is the incorrect password"
#     end
#   end
#
#   def work_invitation
#     puts "you have been invited to the office party"
#   end
#
#   protected
#
#   def take_vacation(days)
#     @vacation_days -= (days)
#   end
#
# end
#
# class Teller < Employee
#   def teller_work
#     puts "do teller stuff"
#   end
# end
#
# class LoanSpecialist < Employee
#   def loan_specialist_work
#     puts "do loan specailist stuff"
#   end
# end
