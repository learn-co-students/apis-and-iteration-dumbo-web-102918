require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get("http://www.swapi.co/api/people/")
  response_hash = JSON.parse(response_string)
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.

# go into results
# loop through array
# if value of name == character
  # return films

  # films_array = []
found_character = response_hash["results"].find do |char|
  char["name"].downcase == character.downcase
end

found_character["films"]


  # response_hash["results"].flatten.each do |char|
  #   char.each do |key, val|
  # binding.pry
  #     if val == character
  #       films_array = char["films"]
  #     end
  #   end
  # end
  # films_array

  # #
  # idx = response_hash["results"].each_with_index do |name, index|
  #   if response_hash["name"].downcase == character
  #     return index
  #   end
  #   #     return response_hash["name"].downcase
  # end

  # char = if response_hash["name"].downcase == character
  #     return response_hash["name"].downcase
  # end



  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def print_movies(films_hash)
  # storing film websites in an array
  # film_websites = films_hash["results"][0]["films"]
  # # gets json
  # film = RestClient.get("https://www.swapi.co/api/films/2/")
  #iterates through website array
  films_hash.each do |website|
    # gets json from each individual website
    website_json = RestClient.get("#{website}")
    # turns json into hash
    website_hash = JSON.parse(website_json)
    # finds each title and puts it to screen
    puts website_hash["title"]
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
