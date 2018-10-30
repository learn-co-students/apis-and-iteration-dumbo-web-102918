require 'rest-client'
require 'json'
require 'pry'

def do_others (character,det)
  nex ="http://www.swapi.co/api/people/?page=1"

  while nex != nil
    response_string = RestClient.get(nex)
    response_hash = JSON.parse(response_string)
    # NOTE: in this demonstration we name many of the variables _hash or _array.
    # This is done for educational purposes. This is not typically done in code.
    response_hash["results"].each do |char_info|
      #binding.pry
      if character == char_info["name"].downcase
        return char_info[det]
      end
    end
    nex = response_hash["next"]
  end
end

def get_character_movies_from_api(character)
  #make the web request
  nex ="http://www.swapi.co/api/people/?page=1"

  while nex != nil
  response_string = RestClient.get(nex)
  response_hash = JSON.parse(response_string)
  films_array=[]
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.
  response_hash["results"].each do |char_info|
    if character == char_info["name"].downcase
       char_info["films"].each do |film_link|
        films_array.push(JSON.parse(RestClient.get(film_link)))
        end
        return films_array
    end


  end
  nex = response_hash["next"]

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
  films_hash.each do |film|
    puts film["title"]
  end
  # some iteration magic and puts out the movies in a nice list
end

def print_others(item)
  puts item
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end
#print_movies(get_character_movies_from_api("Luke Skywalker"))
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
