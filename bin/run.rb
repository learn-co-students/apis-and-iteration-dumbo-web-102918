#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
attribute = get_category

if attribute == "films"
show_character_movies(character)
else
  print_others(do_others(character,attribute))
end
