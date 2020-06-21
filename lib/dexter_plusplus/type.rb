class Type
    extend Findable

    attr_accessor :name, :id, :moves, :pokemon_with_type, :damage_relations, :data, :url
    @@all = []
    @@tag = "type"
    @@limit = 20

    def initialize(name, url)
        self.name = name
        self.url = url
        self.data = JSON.parse(RestClient.get(url))
        self.moves = []
        self.pokemon_with_type = []
        self.damage_relations = {}
        self.set_attributes
        @@all << self
    end

    def set_attributes
        self.id = self.data["id"]
        self.set_damage_relations
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

    def set_damage_relations
       self.damage_relations["double_damage_to"] = self.get_double_damage_to
       self.damage_relations["double_damage_from"] = self.get_double_damage_from
       self.damage_relations["half_damage_to"] = self.get_half_damage_to
       self.damage_relations["half_damage_from"] = self.get_half_damage_from
       self.damage_relations["no_damage_to"] = self.get_no_damage_to
       self.damage_relations["no_damage_from"] = self.get_no_damage_from
    end

    def get_double_damage_to
        output = []
        types = self.data["damage_relations"]["double_damage_to"]
        types.each{|type| output << type["name"]}
        output 
    end

    def get_double_damage_from
        output = []
        types = self.data["damage_relations"]["double_damage_from"]
        types.each{|type| output << type["name"]}
        output 
    end

    def get_half_damage_to
        output = []
        types = self.data["damage_relations"]["half_damage_to"]
        types.each{|type| output << type["name"]}
        output 
    end

    def get_half_damage_from
        output = []
        types = self.data["damage_relations"]["half_damage_from"]
        types.each{|type| output << type["name"]}
        output 
    end

    def get_no_damage_to
        output = []
        types = self.data["damage_relations"]["no_damage_to"]
        types.each{|type| output << type["name"]}
        output 
    end

    def get_no_damage_from
        output = []
        types = self.data["damage_relations"]["no_damage_from"]
        types.each{|type| output << type["name"]}
        output 
    end

    def print_all
        puts "---------------------------------------------------------"
        puts "                  Dexter++ : Type                        ".light_magenta
        puts "---------------------------------------------------------"
        puts "Name: #{self.print_name(self.name)}"
        puts ""
        self.print_damage_relations
        puts "---------------------------------------------------------"    
    end

    def self.print_all
        self.all.each{|type| type.print_all}
    end

    def print_name(name)
        case name
        when "normal"
           name.capitalize.light_black.on_white
        when "fighting"
            name.capitalize.light_red.on_black
        when "flying"
            name.capitalize.light_white.on_magenta
        when "poison"
            name.capitalize.light_green.on_magenta
        when "ground"
            name.capitalize.yellow.on_light_white
        when "bug"
             name.capitalize.light_white.on_green
        when "rock"
             name.capitalize.red.on_yellow
        when "ghost"
             name.capitalize.black.on_light_magenta
        when "steel"
             name.capitalize.light_white.on_light_black
        when "fire"
             name.capitalize.black.on_light_red
        when "water"
             name.capitalize.blue.on_light_blue
        when "grass"
            name.capitalize.green.on_light_cyan
        when "electric"
            name.capitalize.black.on_light_yellow
        when "psychic"
            name.capitalize.light_magenta.on_magenta
        when "ice"
            name.capitalize.light_white.on_cyan
        when "dragon"
            name.capitalize.light_white.on_light_red
        when "dark"
            name.capitalize.light_white.on_black
        when "fairy"
            name.capitalize.light_magenta.on_light_white
        when "unkown"
            name.capitalize.black.on_cyan
        when "shadow"
            name.capitalize.light_magenta.on_light_black
        else
            name.capitalize
        end
    end

    def print_damage_relations
        puts "Damage Relations:"
        puts "\tDouble damage to:"
        self.damage_relations["double_damage_to"].each_with_index{|name, index| puts "\t\t\t#{index + 1}: #{self.print_name(name)}"}
        puts ""
        puts "\tDouble damage from:"
        self.damage_relations["double_damage_from"].each_with_index{|name, index| puts "\t\t\t#{index + 1}: #{self.print_name(name)}"}
        puts ""
        puts "\tHalf damage to:"
        self.damage_relations["half_damage_to"].each_with_index{|name, index| puts "\t\t\t#{index + 1}: #{self.print_name(name)}"}
        puts ""
        puts "\tHalf damage from:"
        self.damage_relations["half_damage_from"].each_with_index{|name, index| puts "\t\t\t#{index + 1}: #{self.print_name(name)}"}
        puts ""
        puts "\tNo damage to:"
        self.damage_relations["no_damage_to"].each_with_index{|name, index| puts "\t\t\t#{index + 1}: #{self.print_name(name)}"}
        puts ""
        puts "\tNo damage from:"
        self.damage_relations["no_damage_from"].each_with_index{|name, index| puts "\t\t\t#{index + 1}: #{self.print_name(name)}"}
    end
end