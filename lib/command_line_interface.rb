require 'pry'
def welcome
  puts "Welcome User!"
end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp
  character.downcase
  #binding.pry
  # use gets to capture the user's input. This method should return that input, downcased.
end

def error_response
  if get_character_from_user == nil
    puts "Try again!"
    get_character_from_user
    binding.pry
  end
end

 0
