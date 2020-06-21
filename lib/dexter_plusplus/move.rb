class Move
    extend Findable
    

    attr_accessor :url, :data, :name, :accuracy, :effect, :power, :pp, :type, :pokemon_with_move, :id
    @@all =[]
    @@tag = "move"
    @@limit = 746

    def initialize(name, url)
        self.name = name
        self.url = url
        self.data = JSON.parse(RestClient.get(url))
        self.set_attributes
        self.pokemon_with_move = []
        @@all << self
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

    def set_attributes
        self.set_accuracy
        self.set_type
        self.set_effect
        self.set_power
        self.set_pp
        self.set_id
    end

    def set_type
        self.type = Type.find_or_create_by_name(self.data["type"]["name"])
    end

    def set_accuracy
        self.accuracy = self.data["accuracy"]
    end

    def set_effect
        self.effect = self.data["effect_entries"][0]["effect"]
    end

    def set_power
        self.power = self.data["power"]
    end

    def set_pp
        self.pp = self.data["pp"]
    end
    
    def set_id
        self.id = self.data["id"]
    end

    def add_pokemon(pokemon)
        self.pokemon_with_move << pokemon
    end

    def print_all
        puts "---------------------------------------------------------"
        puts "                    Dexter++ : Move                   ".light_red
        puts "---------------------------------------------------------"
        puts "Name: #{self.print_name}"
        puts ""
        self.print_type
        puts ""
        self.print_effect
        puts ""
        self.print_power
        puts ""
        self.print_pp
        puts "---------------------------------------------------------"
    end

    def print_name
        self.name.capitalize.light_red
    end

    def get_colored_name
        self.name.capitalize.light_red
    end

    def print_type

        puts "\tType: #{self.type.print_name(type.name)}"
    end
    def print_effect
        puts "\tEffect: #{self.effect}"
    end

    def print_power
        puts "\tPower: #{self.power}"
    end

    def print_pp
        puts "\tPP: #{self.pp}"
    end

    def self.print_all
        self.all.each{|move| move.print_all }
    end

    
end