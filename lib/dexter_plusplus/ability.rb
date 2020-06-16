class Ability


    attr_accessor :name, :id, :effect, :pokemon_with_ability, :url
    @@all = []

    def initialize(name, url, pokemon = nil)
        self.name = name
        self.url = url
        self.pokemon_with_ability = []
        self.set_attributes
        if !pokemon.nil?
            self.add_pokemon(pokemon)
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def set_attributes
        self.set_effect
        self.set_id
    end

    def set_effect
    end

    def set_id
    end

    def add_pokemon(pokemon)
        self.pokemon_with_ability << pokemon
        if !pokemon.abilities.include?(self)
            pokemon.add_ability(self)
        end
    end

    #create abilities and return as array
    def self.create_abilities_from_hash(ability_hash, pokemon = nil)
    end


end
