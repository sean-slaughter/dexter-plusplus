class Type
    extend Findable
    extend Creatable

    attr_accessor :name, :id, :moves, :pokemon_with_type, :data, :url
    @@all = []
    @@tag = "type"

    def initialize(name, url)
        self.name = name.capitalize
        self.url = url
        self.data = JSON.parse(RestClient.get(url))
        self.moves = []
        self.pokemon_with_type = []
        self.set_attributes
        @@all << self
    end

    def set_attributes
        self.id = self.data["id"]
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

    def add_pokemon(pokemon)
       self.pokemon_with_type << pokemon
    end

    def add_move(move)
        if !self.moves.include?(move)
            self.moves << move
        end
    end

end