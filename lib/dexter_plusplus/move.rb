class Move
    extend Findable
    extend Creatable

    attr_accessor :url, :data, :name, :accuracy, :effect, :power, :pp, :type, :pokemon_with_move, :id
    @@all =[]
    @@tag = "move"

    def initialize(name, url)
        self.name = name.capitalize
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
    
end