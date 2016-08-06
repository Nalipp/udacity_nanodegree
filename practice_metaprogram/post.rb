#################################################################################
###########################         CLASS_EVAL        ###########################
#################################################################################

# require_relative 'my_attr'
#
# class Post
#   my_attr_accessor :title, :author
#
#   def initialize(title, author, content)
#     @title = title
#     @author = author
#     @content = content
#   end
# end
#
# post = Post.new('Three Little Pigeons', 'Gary West', 'There once was a witch form the south...')
# p post
# p post.title
# post.author = "Bill Sammy"
# p post.author

#################################################################################
# EXAMPLE : CLASS_EVAL applies to all instances of a class    ###################
#################################################################################

# class Post
#   def initialize(title, author, content)
#     @title = title
#     @author = author
#     @content = content
#   end
# end
#
# Post.class_eval do
#   def testing
#     '123!'
#   end
# end
#
# post = Post.new('Three Little Pigeons', 'Gary West', 'There once was a witch form the south...')
# p post.testing # => '123!'


#################################################################################
# EXAMPLE : BUT CLASS_EVAL can't apply to specific instances of a class  ########
#################################################################################

# class Post
#   def initialize(title, author, content)
#     @title = title
#     @author = author
#     @content = content
#   end
# end
#
# post = Post.new('Three Little Pigeons', 'Gary West', 'There once was a witch form the south...')
#
# post.class_eval do
#   def testing
#     '123!'
#   end
# end
#
# p post.testing # => error

# HOWEVER INSTANCE_EVAL can using singleton_methods


#################################################################################
###########################       INSTANCE_EVAL       ###########################
#################################################################################
# instance_eval allows you to call instances of a class without attr methods. Including private methods

# class Post
#   def initialize(title, author, content)
#     @title = title
#     @author = author
#     @content = content
#   end
# end
#
# post = Post.new('Hello World!', 'Julia', 'This is my first post!')
#
# p post.instance_eval{ @title } #=> "Hello World!"
# p post.instance_eval{ @author } #=> "Julia"
# p post.instance_eval{ @content } #=> "This is my first post!"

#################################################################################
########   SINGLETON_METHODS      (calling instance_eval on a single instance) ##
#################################################################################

#################################################################################
# EXAMPLE : CALLING INSTANCE_EVAL ON AN INSTANCE
#################################################################################

# class Post
#   def initialize(title, author, content)
#     @title = title
#     @author = author
#     @content = content
#   end
# end
#
# post1 = Post.new('Hello World!', 'Julia', 'This is my first post!')
# post2 = Post.new('Three Little Pigeons', 'Gary West', 'There once was a witch form the south...')

# post1.instance_eval do
#   def testing
#     '123!'
#   end
# end
#
# p post1.testing # => "123!"
# # p post2.testing # => error
# p Post.testing # => error

#################################################################################
# EXAMPLE : CALLING INSTANCE_EVAL ON A CLASS
#################################################################################

# class Post
#   def initialize(title, author, content)
#     @title = title
#     @author = author
#     @content = content
#   end
# end
#
# Post.instance_eval do
#   def testing
#     "123!"
#   end
# end
#
# post1 = Post.new('Hello World!', 'Julia', 'This is my first post!')
# post2 = Post.new('Three Little Pigeons', 'Gary West', 'There once was a witch form the south...')
#
# # p post1.testing # => error
# p Post.testing # => '123!'

#################################################################################
# CONCLUSION : You can call class_eval on an entire class
############ : All instances of that class will apply
############ : But you can't call class_eval on a singleton_method or single instance
############ : instance_eval can be use as a singleton_method or single instance
############ : instance_eval can also be used to access a single instance variable of a class
############ :  post.instance_eval{ @content } #=> "This is my first post!"
############ : But if you call instance_eval on an entire class you can only call the class object
############ :  not the instances created in the class
#################################################################################



#################################################################################
#########################         DEFINE_METHOD        ##########################
#################################################################################

# require_relative 'my_attr'
#
# class Post
#
#   def initialize(title, author, content)
#     @title = title
#     @author = author
#     @content = content
#   end
#
#   (1..500).each do |n|
#     self.send( :define_method, "get_post_#{n}") do
#       "I got #{n}"
#     end
#   end
# end
#
# post = Post.new('Three Little Pigeons', 'Gary West', 'There once was a witch form the south...')
# p post.get_post_1
# p post.get_post_3
# p post.get_post_500

#################################################################################
# send can be used to call methods (even private ones) by sending the name of the
# method to be called and its arguments to the object.
# object.send(:method_name, *arguments)
#################################################################################



#################################################################################
########################         METHOD_MISSING        ##########################
#################################################################################

    ########################         EXAMPLE        ##########################
# class Presenter
#   attr_accessor :object
#
#   def initialize(object)
#     self.object = object
#   end
#
#   # If a method we call is missing, pass the call onto
#   # the object we delegate to.
#   def method_missing(m, *args, &block)
#     puts "Delegating #{m}"
#     object.send(m, *args, &block)
#   end
# end
#
#
# class UserPresenter < Presenter
#   # We just want to display the first letter of the last name
#   def last_name
#     "#{object.last_name[0]}."
#   end
#
#   def full_name
#     "#{first_name} #{last_name}"
#   end
#
# end
#
# User = Struct.new(:first_name, :last_name, :age)
# user = User.new("Leigh", "Halliday", 30)
# user_presenter = UserPresenter.new(user)
#
# puts user_presenter.full_name
# puts user_presenter.age
