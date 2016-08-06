require 'bundler'
require 'artii'
require 'date'
require 'udacicharts'
require 'pp'
require 'colorize'

date = Date.today

def stars
  "*".colorize(:blue)*11
end

puts stars + date.strftime("%a %d %b %Y").colorize(:yellow) + stars

a = Artii::Base.new :font => 'big'
puts a.asciify('HOT 100').colorize(:magenta)

hot100 = BillboardCharts.new.get_list(limit=100)

hot100.each_with_index { |song, i| puts "#{i+1}. #{song[1]} - #{song[0]}" }
