class Item
    extend Findable
    extend Creatable

        attr_accessor :name, :url, :effect, :id, :data 
        @@all = []
        @@tag = "item"
        @@limit = 954

        def initialize(name, url)
            self.name = name.capitalize.light_green
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

        def self.limit
            @@limit
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

        def print_name
            puts "\tName: #{self.name}"
        end

        def print_effect
            puts "\tEffect: #{self.effect}"
        end

        def print_all
            puts "---------------------------------------------------------"
            self.print_name
            puts ""
            self.print_effect
            puts "---------------------------------------------------------"
        end

        def self.print_all
            self.all.each{|item| item.print_all}
        end



end