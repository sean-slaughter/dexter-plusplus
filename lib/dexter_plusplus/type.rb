class Type

    attr_accessor :name, :id, :moves, :pokemon
    @@all = []

    def initialize(name, url)
        self.name = name
        self.url = url
        self.moves = []
        self.pokemon = []
        self.set_attributes
        @@all << self
    end

    def set_attributes
    end

    #create array of types from hash
    def self.create_types_from_hash(type_hash, pokemon = nil)
    end

    def add_pokemon(pokemon)
        if !self.pokemon.include?(pokemon)
            self.pokemon << pokemon
        end
        if !pokemon.types.include(self)
            pokemon.add_type(self)
        end
    end