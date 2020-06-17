class Ability
    extend Findable
    extend Creatable

    attr_accessor :name, :id, :effect, :pokemon_with_ability, :url, :data 
    @@all = []
    @@tag = "ability"

    def initialize(name, url)
        self.name = name.capitalize
        self.url = url
        self.data = JSON.parse(RestClient.get(url))
        self.pokemon_with_ability = []
        self.set_attributes
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tag
        @@tag
    end

    def tag
        @@tag
    end

    def set_attributes
        self.set_effect
        self.set_id
    end

    def set_effect
        self.effect = self.data["effect_entries"][1]["effect"]
    end

    def set_id
        self.id = self.data["id"]
    end

    def add_pokemon(pokemon)
        self.pokemon_with_ability << pokemon
    end

end
