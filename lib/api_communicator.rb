require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


name = response_hash["results"].find do |hash|
  hash["name"].downcase == character
end

if name == nil
  puts "Try again!"
  get_character_from_user
    # everythign is good, we have a name and work normally
# else
#   puts "Try again!" # we don't have a name to use so do something like..

return []
else
  all_movies = name["films"].collect do |film_results|
    movies =  RestClient.get(film_results)
    movies_response = JSON.parse(movies)
  end

  return all_movies
end


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
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |movie_hash|
   puts movie_hash["title"]
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

































# film_url = response_hash["results"][0]["films"]

# response_hash["results"].each do |result|
#  result.each do |k,v|

#film_url.each do |info|
#  RestClient.get(info)
# end
#response_hash["results"].each do |result|
#  result["films"]
