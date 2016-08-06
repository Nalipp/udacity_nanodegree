class Tribe
  attr_reader :name, :members

  def initialize(opts={})
    @name = opts[:name]
    @members = opts[:members]
    puts "The '#{name}' tribe has been created."
  end

  def tribal_council(opts={})
    @members.reject! { |member| member == opts[:immune] }
    @members.sample
  end

  def to_s
    name
  end
end
