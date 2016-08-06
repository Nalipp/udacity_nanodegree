# class WeatherReport
#   def initialize(options={})
#     @data = options
#   end
#
#   def report
#     puts report_temp
#     puts report_precip
#   end
#
#   def report_temp
#     return "It's hot outside!" if is_hot?
#     return "It's warm outside!" if is_warm?
#     return "It's cold outside!" if is_cold?
#   end
#
#   def report_precip
#     is_raining? ? "It's raining outside!" : "It's not raining outside!"
#   end
#
#   def is_hot?
#     @data[:temp] >= 80
#   end
#
#   def is_warm?
#     @data[:temp] >= 60 && @data[:temp] < 80
#   end
#
#   def is_cold?
#     @data[:temp] < 60
#   end
#
#   def is_raining?
#     @data[:precip]
#   end
#
#   def test_default_report
#     # create a WeatherReport object
#     @weather_report = WeatherReport.new
#
#     # checks if "No weather data yet!" exists in
#     # the @weather_report.report array
#     assert_includes @weather_report.report, "No weather data yet!"
#   end
# end

# # Testing out possible inputs!
# puts WeatherReport.new(temp: 80, precip: true).report # hot, raining
# puts WeatherReport.new(temp: 60, precip: true).report # warm, raining
# puts WeatherReport.new(temp: 59, precip: true).report # cold, raining
# puts WeatherReport.new(temp: 80, precip: false).report # hot, not raining
# puts WeatherReport.new(temp: 60, precip: false).report # warm, not raining
# puts WeatherReport.new(temp: 59, precip: false).report # cold, not raining


###########################################################################
######################### Minitest Notes ##################################
###########################################################################

# documentation http://docs.seattlerb.org/minitest/Minitest/Assertions.html#method-i-assert_includes
# most common test methods

# assert(expression, optional_message): Passes if the expression is truthy
# assert_equal(expected_value, actual_value, optional_message): Passes if the expected and actual values are the equal.
# assert_includes(collection, expected_value, optional_message): Passes if the collection (Array, Hash, etc.) contains the expected value.
# Each type of assert statement has an equivalent refute statement that checks for the opposite value. assert_equal checks for equality. refute_equal checks for inequality.
