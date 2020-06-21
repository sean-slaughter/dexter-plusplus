class Ability
    extend Findable

    attr_accessor :name, :id, :effect, :pokemon_with_ability, :url, :data 
    @@all = []
    @@tag = "ability"
    @@limit = 293

    def initialize(name, url)
        self.name = name
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

    def self.limit
        @@limit
    end

    def set_attributes
        self.set_effect
        self.set_id
    end

    def set_effect
        effect_entries = self.data["effect_entries"]
        effect_entries.each do |entry|
            if entry["language"]["name"] == "en"
                self.effect = entry["effect"]
            end
        end
    end

    def set_id
        self.id = self.data["id"]
    end

    def add_pokemon(pokemon)
        self.pokemon_with_ability << pokemon
    end

    def print_all
        puts "---------------------------------------------------------"
        puts "                    Dexter++ : Ability                   ".light_blue
        puts "---------------------------------------------------------"
        self.print_name
        puts ""
        self.print_effect 
        puts "---------------------------------------------------------"
    end

    def self.print_all
        @@all.each {|ability| ability.print_all}
    end

    def print_name
        puts "Name: #{self.name.capitalize.light_blue}"
    end

    def get_colored_name
        self.name.capitalize.light_blue
    end

    def print_effect
        puts "Effect: #{self.effect}"
    end

end
