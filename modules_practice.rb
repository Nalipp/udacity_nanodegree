#  Example of module methods that use include to DRY code

module SuperActions
  def save_people
    "I just want to help"
  end

  def wear_costume
    "this costume is tight"
  end

  def fly
    "flying now.. awesome"
  end
end

class Superman
  include SuperActions

  def visit_krypton
    "im in krypton"
  end
end

class WonderWoman
  include SuperActions

  def visit_greece
    "i'm in greece"
  end
end

#  Example of class methods that use extende becuase Class.new

module Puppify
  def new_pups(pups)
    @@puppies = []
    pups.times do |pup|
      @@puppies << Dog.new
    end
    return @@puppies
  end
end

class Dog
  extend Puppify
end

puts Dog.new_pups(2)


#  Inheritence

class Dog
  def initialize(breed)
    @breed = breed
  end
end

class Lab < Dog
  def initialize(breed, name)
    super(breed)
    @name = name
  end

  def to_s
    "(#@breed, #@name)"
  end
end

puts Lab.new("Labrador", "Benny").to_s

class Mammal
  attr_reader :legs

  def initialize(legs)
    @legs = legs
  end

  def eat_meat
    "tasty chicken"
  end

  def have_hair
    "furry"
  end
end

module Cat
  def no_swimming
    "Meow!! I'm angry"
  end

  def bitchy
    "the queen"
  end
end

class PetCat < Mammal
  include Cat
  attr_reader :name, :trait

  def initialize(name, trait, legs)
    super(legs)
    @name = name
    @trait = trait
  end

  def pet_name
    "My name is #{name}"
  end

  def personality
    "I'm am very #{trait}"
  end

  def count_legs
    "I have #{legs} legs"
  end
end

kate = PetCat.new("kate", "happy", 4)

puts kate.personality
puts kate.pet_name
puts kate.no_swimming
puts kate.eat_meat
puts kate.count_legs

module UdaciBlog
  class Post
    # ...
  end

  class CatPost < Post
    # ...
  end

  class DogPost < Post
    # ...
  end

  class BunnyPost < Post
    # ...
  end
end

module MyBlog
  class Post
    # ...
  end
end

UdaciBlog::Post.new
