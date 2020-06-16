class Type

    attr_accessor :name, :id, :moves, :pokemon
    @@all = []

    def initialize(name, url, pokemon = nil)
        self.name = name
        self.url = url
        self.moves = []
        self.pokemon = []
        self.set_attributes
        if pokemon
            self.add_pokemon(pokemon)
        end
        @@all << self
    end

    def set_attributes
    end

    def self.all
        @all
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

    def self.find_or_create_by_name(name, url, pokemon = nil)
        if self.all.find{|type| type.name == name}
            self.all.find{|type| type.name == name}
        else
            self.new(name, url, pokemon)
        end