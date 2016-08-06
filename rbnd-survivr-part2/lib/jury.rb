class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(contestant)
    @members << contestant
  end

  def cast_votes(finalist)
    @finalists = Hash[finalist.map {|name| [name, 0]}]

    @members.map do |member|
      keys = @finalists.keys
      vote = keys[rand(keys.size)]
      puts "#{member} voted for #{vote}."
      @finalists[vote] += 1
    end
    @finalists
  end

  def report_votes(final_votes)
    final_votes.each { |k,v| puts "#{k} recieved #{v} votes" }
  end

  def announce_winner(final_votes)
    winner = final_votes.max_by{|k,v| v}[0].name
    final_winner = final_votes.select { |contestant| contestant.name == winner }.keys.first
    puts "The winner is #{winner}."
    final_winner
  end
end
