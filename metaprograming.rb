class String
  def create_greeting(name)
    "Hello #{name}, How are you today?"
  end
end

puts "Tom".create_greeting("bill")

class Post
  def initialize
  end
end

Post.class_eval do
  def hello
    puts "Welcome!"
  end
end

post = Post.new
post.hello #=> "Welcome!"

String.class_eval do
  def hello
    puts "My custom greeting.. Hi"
  end
end

nate = String.new
puts nate.hello

# Define a method called "method_name"
# that returns an instance variable called "@instance_var"
ClassName.class_eval { def method_name; @instance_var; end }
# Does the same thing as above, but
# it's much nicer in multiple lines!
ClassName.class_eval {
  def method_name
    @instance_variable_name
  end
}

# Defines a method--The name of the method and instance variable
# is created from the value of "attribute"
ClassName.class_eval("def #{attribute}; @#{attribute}; end")
# Use %Q{ ... } for String interpolation and set value
# of "new_method" to the string
new_method = %Q{
   def find_by#{some_value}_and_#{other_value}
      # method does something
   end
}

# Pass variable into class_eval as an argument
ClassName.class_eval(new_method)

class Module
  def name_accessor(name)
    self.class_eval("def #{name}=(val); @#{name} = val; end")
    self.class_eval("def #{name}; @#{name}; end")
  end
end

class Cat
  name_accessor :name
  def initialize(name)
    @name = name
  end
end

cat = Cat.new("Maeby")
cat.name = "Jacq"
puts cat.name

#Version 3 - general attr_accessor
 def my_attr_accessor(*attributes)
   attributes.each do |attribute|
     # for each attribute, use String interpolation
     # to generate the methods, and set attr_methods
     # equal to the generated string
     attr_methods = %Q{
       def #{attribute}
         @#{attribute}
       end
       def #{attribute}=(val)
         @#{attribute} = val
       end
     }
     # call class_eval and pass in attr_methods
     class_eval(attr_methods)
   end
 end


################  class Post example   #################

class Module
  def my_attr_reader(*attributes)
    attributes.each do |attribute|
      self.class_eval("def #{attribute}; @#{attribute}; end")
      # note: you could leave out self, since self is implied
    end
  end

  def my_attr_writer(*attributes)
    attributes.each do |attribute|
      self.class_eval("def #{attribute}=(val); @#{attribute} = val; end")
    end
  end
end

class Post
  my_attr_reader :title
  my_attr_writer :author

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  private
    def destroy_contents
      puts "pew pew pew!"
    end
end

post = Post.new("Hello World", "Julia", "This is my first post!")
post.instance_eval{ destroy_contents }


post = Post.new("Jake the Snake goes to reading camp", "Hedi Drake", "Once upon a time there was an extrodinary..." )
p post.title
p post.author = "Tim Bill"
p post.instance_eval{ @content }
post.instance_eval{ destroy_contents }


post1 = Post.new("Hello World", "Julia", "This is my first post!")
post1.instance_eval do
  # singleton method called testing
  # can only be used with post1
  def testing
    "123!"
  end
end

puts post1.testing #=> 123!

# post2 = Post.new("Hello World", "Julia", "This is my first post!")
#
# puts post2.testing #=> NoMethodError

Post.instance_eval do
  def greeting
    "Hello nice to meet you"
  end
end

Post.class_eval do
  def testing
    "!!-_-!!"
  end
end

bill = Post.new("Hello World", "Julia", "This is my first post!")
p bill.testing


#################  Define Method  ###############

class Post
  (1..500).each do |n|
    self.send(:define_method, "get_post_#{n}") do
      puts "I got post ##{n}"
    end
  end
end

bill = Post.new
bill.get_post_10
bill.get_post_379



#################  method_missing  ###############


class Post
  attr_reader :title
  attr_writer :author

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def existing_method
    puts "I exist!"
  end
  def method_missing(method_name, *arguments)
  puts "No method named #{method_name}"
      if [check if method name starts with find_by_...]
        # use define_method or class_eval to define new methods
        # call the method using send
      else
        # if you can't find the method... keep looking!
        super
      end

  end
end

post = Post.new("Hello World", "Julia", "This is my first post!")
post.existing_method #=> I exist!
post.find_by_post_id(1) #=> No method named find_by_post_id
post.get_all_posts_with_cats #=> No method named get_all_posts_with_cats
post.metaprogramming_is_fun("yay!") #=> No method named metaprogramming_is_fun


def respond_to_missing?(method_name, include_private_methods = true/false)
  super unless method_name.to_s.start_with?('post_')
end
