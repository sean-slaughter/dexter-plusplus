require "pry"
require "json"
require "rest-client"

require_relative "./concerns/creatable"
require_relative "./concerns/findable"
require_relative "./dexter_plusplus/version"
require_relative "./dexter_plusplus/pokemon"
require_relative "./dexter_plusplus/move"
require_relative "./dexter_plusplus/ability"
require_relative "./dexter_plusplus/item"
require_relative "./dexter_plusplus/api"
require_relative "./dexter_plusplus/cli"
require_relative "./dexter_plusplus/type"


#TODO Add requirements here - ALL CLASSES YOU WRITE
module DexterPlusplus
  class Error < StandardError; end
  # Your code goes here...
end
