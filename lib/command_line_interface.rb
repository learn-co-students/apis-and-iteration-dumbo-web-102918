def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end


def get_character_from_user
  puts "Please enter a character:"
  return gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_category
  puts "Please enter attribute from this list:"
  puts "height"
  puts "hair_color"
  puts "skin_color"
  puts "eye_color"
  puts "birth_year"
  puts "gender"
  puts "films"
  return gets.chomp.downcase
end
