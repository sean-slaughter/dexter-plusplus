class Move

    attr_accessor :url, :name, :accuracy, :effect, :power, :pp, :type, :pokemon_with_move, :id
    @@all =[]

    def initialize(name, url, pokemon = nil)
        self.pokemon_with_move = []
        self.name = name.capitalize
        self.url = url
        self.set_attributes
        if !pokemon.nil?
            self.add_pokemon(pokemon)
        end
        @@all << self
    end

    def set_attributes
        self.set_accuracy
        self.set_effect
        self.set_power
        self.set_pp
        self.set_type
    end

    def set_accuracy
    end

    def set_effect
    end

    def set_power
    end

    def set_pp
    end

    def set_type
    end

    def add_pokemon(pokemon)
        self.pokemon_with_move << pokemon
        if !pokemon.moves.include?(self)
            pokemon.add_move(self)
        end
    end

    #create moves from hash and return as array
    def self.create_moves_from_hash(moves_hash, pokemon = nil)
    end

    
end