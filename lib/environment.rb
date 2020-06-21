require "pry"
require "json"
require "rest-client"
require "colorize"
require "tty-prompt"


require_relative "./dexter_plusplus/cli"
require_relative "./concerns/findable"
require_relative "./dexter_plusplus/version"
require_relative "./dexter_plusplus/pokemon"
require_relative "./dexter_plusplus/move"
require_relative "./dexter_plusplus/ability"
require_relative "./dexter_plusplus/item"
require_relative "./dexter_plusplus/type"
require_relative "./dexter_plusplus/api"
require_relative "./dexter_plusplus/pokemon_menu"
require_relative "./dexter_plusplus/move_menu"
require_relative "./dexter_plusplus/item_menu"
require_relative "./dexter_plusplus/ability_menu"
require_relative "./dexter_plusplus/type_menu"




#TODO Add requirements here - ALL CLASSES YOU WRITE
module DexterPlusplus
  class Error < StandardError; end
  # Your code goes here...
end
