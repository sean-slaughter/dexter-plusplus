class Type
    extend Findable
    extend Creatable

    attr_accessor :name, :id, :moves, :pokemon_with_type, :data, :url
    @@all = []
    @@tag = "type"
    @@limit = 20

    def initialize(name, url)
        self.name = self.set_name(name.capitalize)
        self.url = url
        self.data = JSON.parse(RestClient.get(url))
        self.moves = []
        self.pokemon_with_type = []
        self.set_attributes
        @@all << self
    end

    def set_attributes
        
        self.id = self.data["id"]
    end

    def self.all
        @@all
    end

    def self.tag
        @@tag
    end
    
    def self.limit
        @@limit
    end
    
    def tag
        @@tag
    end

    def add_pokemon(pokemon)
       self.pokemon_with_type << pokemon
    end

    def add_move(move)
        if !self.moves.include?(move)
            self.moves << move
        end
    end

    def print_all
        puts "---------------------------------------------------------"
        puts "\tName: #{self.name}"
        puts "---------------------------------------------------------"    
    end

    def self.print_all
        self.all.each{|type| type.print_all}
    end

    def set_name(name)
        case name
        when "Normal"
            name.light_black.on_white
        when "Fighting"
            name.light_red.on_black
        when "Flying"
            name.light_white.on_magenta
        when "Poison"
            name.light_green.on_magenta
        when "Ground"
            name.yellow.on_light_white
        when "Bug"
            name.light_white.on_green
        when "Rock"
            name.red.on_yellow
        when "Ghost"
            name.black.on_light_magenta
        when "Steel"
            name.light_white.on_light_black
        when "Fire"
            name.black.on_light_red
        when "Water"
            name.blue.on_light_blue
        when "Grass"
            name.green.on_light_cyan
        when "Electric"
            name.black.on_light_yellow
        when "Psychic"
            name.light_magenta.on_magenta
        when "Ice"
            name.light_white.on_cyan
        when "Dragon"
            name.light_white.on_light_red
        when "Dark"
            name.light_white.on_black
        when "Fairy"
            name.light_magenta.on_light_white
        when "Unkown"
            name.black.on_cyan
        when "Shadow"
            name.light_magenta.on_light_black
        else
            name
        end
    end
    

end