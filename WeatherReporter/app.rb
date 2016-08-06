class WeatherReport
  attr_writer :fahrenheit, :rain, :snow, :celsius

  def initialize
    @report = []
  end

  def report
    analyze_today_temp
    analyze_hot_warm_cold
    analyze_precipitation
    @report << "No weather data yet!" if @report.size == 0
    return @report
  end

  def analyze_today_temp
    @report << "Today's temperature is #{@celsius}°C!" if @celsius
    @report << "Today's temperature is #{@fahrenheit}°F!" if @fahrenheit && !@celsius
  end

  def analyze_hot_warm_cold
    @report << "It's hot out!" if is_hot?
    @report << "It's warm out!" if is_warm?
    @report << "It's cold out!" if is_cold?
  end

  def analyze_precipitation
    @report << "You may want to wear snow boots." if @snow
    @report << "You may want to wear a raincoat." if @rain
  end

  def c_to_f
    @fahrenheit = @celsius * 1.8 + 32
  end

  def is_hot?
    return @fahrenheit ? @fahrenheit >= 80 : false
  end

  def is_warm?
    return @fahrenheit ? @fahrenheit < 80 && @fahrenheit >= 60 : false
  end

  def is_cold?
    return @fahrenheit ? @fahrenheit < 60 : false
  end
end
