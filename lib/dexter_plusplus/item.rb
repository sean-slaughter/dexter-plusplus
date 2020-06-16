class Item

        attr_accessor :name, :url, :effect, :id
        @@all = []

        def initialize(name, url)
            self.name = name.capitalize
            self.url = url
            self.set_attributes
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

end