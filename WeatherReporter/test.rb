require 'minitest/autorun'
require_relative 'app'

class TestWeatherReport < MiniTest::Test

  # Creates a WeatherReport object that will be
  # available to all the testing methods
  def setup
    @weather_report = WeatherReport.new
  end

  # Should tell "No weather data yet!" user
  # when there is no data to report
  def test_default_report
    assert_includes @weather_report.report, "No weather data yet!"
  end

  # Should convert to fahrenheit
  # when given celsius temperature
  def test_celsius_to_fahrenheit
    @weather_report.celsius = 20
    assert_equal 68, @weather_report.c_to_f
  end

  # Should display celsius temperature
  # when celsius temperature is given in weather data
  def test_display_celsius_if_celsius_is_given
    @weather_report.celsius = 20
    assert_includes @weather_report.report, "Today's temperature is 20°C!"
  end

  # Should display fahrenheit temperature
  # when fahrenheit temperature is given in weather data
  def test_display_fahrenheit_if_fahrenheit_is_given
    @weather_report.fahrenheit = 50
    assert_includes @weather_report.report, "Today's temperature is 50°F!"
  end

  # Should display weather is hot
  # when weather is 80 degrees
  def test_correctly_reports_hot_weather
    @weather_report.fahrenheit = 80
    assert_includes @weather_report.report, "It's hot out!"
  end

  # Should display weather is warm
  # when weather is 60 degrees
  def test_correctly_reports_warm_weather
    @weather_report.fahrenheit = 60
    assert_includes @weather_report.report, "It's warm out!"
  end

  # Should display weather is cold
  # when weather is 59 degrees
  def test_correctly_reports_cold_weather
    @weather_report.fahrenheit = 59
    assert_includes @weather_report.report, "It's cold out!"
  end

  # Should suggest the user wear a raincoat
  # if it is raining
  def test_rain_message
    @weather_report.rain = true
    assert_includes @weather_report.report, "You may want to wear a raincoat."
  end

  # Should suggest the user wear snow boots
  # if it is snowing
  def test_snow_message
    @weather_report.snow = true
    assert_includes @weather_report.report, "You may want to wear snow boots."
  end

end
