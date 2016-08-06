class Game
  attr_reader :tribes

  def initialize(tribe1, tribe2)
    @tribes = []
    @tribes << tribe1
    @tribes << tribe2
  end

  def add_tribe(tribe3)
    @tribes << tribe3
  end

  def self.tribes
    @tribes
  end

  def merge(new_tribe_name)
    combined_members = @tribes.map { |tribe| tribe.members }.flatten
    Tribe.new({name: new_tribe_name, members: combined_members})
  end

  def immunity_challenge
    @tribes.sample
  end

  def individual_immunity_challenge
    immunity_challenge.members.sample
  end

  def clear_tribes
    @tribes = []
  end
end
