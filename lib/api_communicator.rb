require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  film_array= []
  response_hash["results"].collect do |k|
    film_array = k["films"] if k["name"] == character
  end
film_array
end


def print_movies(films_hash)
  results = []
  films_hash.each do |name|
    response_string = RestClient.get(name)
    response_hash = JSON.parse(response_string)
    results << response_hash["title"]
  end

  puts "Movie List"
  results.each_with_index do |title, index|
    puts "#{index+1}. #{title}"
  end
end
#print_movies(get_character_movies_from_api("Luke Skywalker"))

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
