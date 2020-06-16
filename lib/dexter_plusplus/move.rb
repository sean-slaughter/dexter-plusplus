class Move

    attr_accessor :url, :data, :name, :accuracy, :effect, :power, :pp, :type, :pokemon_with_move, :id
    @@all =[]

    def initialize(name, url, pokemon = nil)
        self.pokemon_with_move = []
        self.name = name.capitalize
        self.url = url
        self.data = JSON.parse(RestClient.get(url))
        self.set_attributes
        if !pokemon.nil?
            self.add_pokemon(pokemon)
        end
        @@all << self
    end

    def set_attributes
        self.set_accuracy
        self.set_type
        self.set_effect
        self.set_power
        self.set_pp
    end

    def set_type
        self.type = Type.find_or_create_by_name(self.data["type"]["name"], self.data["type"]["url"])
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
        if !pokemon.moves.include?(self)
            pokemon.add_move(self)
        end
    end

    #create moves from hash and return as array
    def self.create_moves_from_hash(moves_hash, pokemon = nil)
    end

    
end