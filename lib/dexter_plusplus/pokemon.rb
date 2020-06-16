class Pokemon

    attr_accessor :name, :moves, :abilities, :base_stats, :height, :weight, :generation, :types, :url, :id, :data
    @@all = []

    def initialize(name, url)
        self.name = name.capitalize
        self.url = url
        self.data = JSON.parse(RestClient.get(url))
        self.moves = []
        self.abilities = []
        self.types = []
        self.set_attributes
        @@all << self
    end

    def set_attributes
        self.set_moves
        self.set_abilities
        self.set_type
        self.set_generation
        self.id = self.data["id"]
        self.height = self.data["height"]
    end

    def set_moves
        moves_hash = self.data["moves"]
        move_array = Moves.create_moves_from_hash(moves_hash, self)
        move_array.each{|move| self.add_move(move)}
    end

    def set_abilities
        ability_hash = self.data["abilities"]
        ability_array = Ability.create_abilities_from_hash(ability_hash, self)
        ability_array.each{|ability| self.add_ability(ability)}
    end

    def set_type
        type_hash = self.data["types"]
        type_array = Type.create_types_from_hash(type_hash)
        type_array.each {|type| self.add_type(type)}
    end

   

        #set generation by using id number (make constants with generation numbers)
    def set_generation

    end

    def set_base_stats

    end

    def add_move(move)
        self.moves << move
        if !moves.pokemon_with_move.include?(self)
            moves.add_pokemon(self)
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
        if !type.pokemon.include?(self)
            type.add_pokemon(self)
        end
    end



end