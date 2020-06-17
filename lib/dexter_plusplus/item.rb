class Item
    extend Findable
    extend Creatable

        attr_accessor :name, :url, :effect, :id, :data 
        @@all = []
        @@tag = "item"

        def initialize(name, url)
            self.name = name.capitalize
            self.url = url
            self.data = JSON.parse(RestClient.get(url))
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
            self.effect = self.data["effect_entries"][0]["effect"]
        end

        def set_id
            self.id = self.data["id"]
        end

end