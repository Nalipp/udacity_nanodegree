# definitions = {
#   bumfuzzle: "confuse; perplex; fluster",
#   cattywampus: "askew, awry, kitty-corner",
#   taradiddle: "pretentious nonsense"
# }
#
# definitions["Flibbertigibbet"] = "nonesense, balderdash"
#
#
# definitions.each { |key, value| puts "#{key}"}

friends = [
  {
    name: "Diego",
    status: "Online"
  },
  {
    name: "Liam",
    status: "Away"
  },
  {
    name: "Gloria",
    status: "Online"
  },
  {
    name: "Charlie",
    status: "Away"
  }
]

everyone_is_online = friends.map do |friend|
    {name: friend[:name], status: "Online"}
end

puts everyone_is_online

# friends.each { |friend| puts "#{friend[:name]} is #{friend[:status]}"}
# online_friends friends.select { |friend| (friend[:status] == "Online") }

# online_friends = []
#
# friends.each do |value|
#   if value[:status] == "Online"
#     online_friends.push(value)
#   end
# end

# online_friends = friends.select do |value|
#   value[:status] == "Online"
# end

# online_friends = friends.select { |value| value[:status] == "Online"}
#
# puts online_friends

# change_friend_status = friends.map { |value| value[:status] == "Online" }
# puts friends[0]

# puts change_friend_status
