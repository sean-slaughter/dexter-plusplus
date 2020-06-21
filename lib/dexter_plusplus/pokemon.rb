class Pokemon

    extend Findable

    attr_accessor :name, :moves, :abilities, :base_stats, :height, :weight, :generation, :types, :url, :id, :data
    @@all = []
    @@tag = "pokemon"
    @@limit = 807

    #do not load any pokemon outside of these id #'s
    CONST_GENERATIONS = [151, 251, 386, 493, 649, 721, 807]

    def initialize(name, url)
        self.name = name
        self.url = url
        self.data = JSON.parse(RestClient.get(url))
        self.moves = []
        self.abilities = []
        self.types = []
        self.base_stats = []
        self.set_attributes
        @@all << self
    end

    def self.all
        @@all
    end

    def tag
        @@tag
    end

    def self.tag
        @@tag
    end

    def self.limit
        @@limit
    end

    def set_attributes
        self.set_moves
        self.set_abilities
        self.set_types
        self.set_id
        self.set_generation
        self.set_height
        self.set_weight
        self.set_base_stats
    end

    def set_moves
        move_array = Move.find_from_array(self.data["moves"].first(4))
        move_array.each{|move| self.add_move(move)}
    end

    def set_abilities
       ability_array = Ability.find_from_array(self.data["abilities"])
       ability_array.each{|ability| self.add_ability(ability)}
    end

    def set_types
        type_array = Type.find_from_array(self.data["types"])  
        type_array.each{|type| self.add_type(type)}
    end

    def set_id
        self.id = self.data["id"]
    end

    def set_height
        self.height = self.data["height"]
    end

    def set_weight
        self.weight = self.data["weight"]
    end


        #set generation by using id number (make constants with generation numbers)
    def set_generation
        i = 0
        while i < CONST_GENERATIONS.size && self.generation.nil?
            if self.id > CONST_GENERATIONS[i]
                i += 1
            else
                self.generation = i + 1
            end
        end
    end

    def set_base_stats
        stats = self.data["stats"]
        stats.each do |stat|
            self.base_stats << "#{stat["stat"]["name"]}: #{stat["base_stat"]}"
        end
    end

    def add_move(move)
        self.moves << move
        if !move.pokemon_with_move.include?(self)
            move.add_pokemon(self)
        end
    end

    def add_ability(ability)
        self.abilities << ability
        if !ability.pokemon_with_ability.include?(self)
            ability.add_pokemon(self)
        end
    end

    def add_type(type)
        self.types << type
        if !type.pokemon_with_type.include?(self)
            type.add_pokemon(self)
        end
    end

    def print_all
        puts "---------------------------------------------------------"
        puts "                    Dexter++ : Pokemon                     ".light_yellow
        puts "---------------------------------------------------------"
        self.print_name
        puts ""
        self.print_generation
        self.print_weight_and_height
        puts ""
        self.print_types
        puts ""
        self.print_abilities
        puts ""
        self.print_moves
        puts ""
        self.print_base_stats
        puts "---------------------------------------------------------"
    end

    def self.print_all
        self.all.each{|pokemon| pokemon.print_all}
    end

    def print_name
        puts "Name: #{self.name.capitalize.light_yellow}"
    end

    def get_colored_name
        self.name.capitlize.light_yellow
    end

    def print_types
        output = "\tTypes:\n"
        self.types.each_with_index{|type, index| output += "\t\t#{index + 1}: #{type.print_name(type.name)}\n"}
        puts output
    end

    def print_abilities
        output = "\tAbilities:\n"
        self.abilities.each_with_index{|ability, index| output += "\t\t#{index + 1}: #{ability.get_colored_name}\n"}
        puts output
    end

    def print_moves
        output = "\tMoves:\n"
        self.moves.each_with_index{|move, index| output += "\t\t#{index + 1}: #{move.get_colored_name}\n"}
        puts output
    end

    def print_base_stats
        output =  "\tBase Stats:\n"
        self.base_stats.each{|stat| output += "\t\t#{stat.capitalize}\n"}
        puts output
    end

    def print_weight_and_height
        puts "\tHeight: #{self.height}"
        puts "\tWeight: #{self.weight}"
    end

    def print_generation
        puts "\tGeneration: #{self.generation}"
    end

end