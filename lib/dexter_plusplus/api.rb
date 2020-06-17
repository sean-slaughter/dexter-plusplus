
class API
    BASE_URL = "https://pokeapi.co/api/v2"

    def self.get_pokemon_by_name(pokemon)
        begin
            Pokemon.find_or_create_by_name(pokemon)
        rescue => e
            puts "Error loading Pokemon by name."
        end
    end

    def self.get_type_by_name(type)
        begin
            Type.find_or_create_by_name(type)
        rescue => e
            puts "Error loading type by name."
        end
    end

    def self.get_move_by_name(move)
        begin
            Type.find_or_create_by_name(move)
        rescue => e
            puts "Error loading move by name."
        end
    end

    def self.get_item_by_name(item)
        begin
            Item.find_or_create_by_name(item)
        rescue => e
            puts "Error loading item by name."
        end
    end

    def self.get_items
        items_data = JSON.parse(RestClient.get("#{BASE_URL}/item"))
        items_data["results"].each{|item| Item.new(item["name"], item["url"])}
        Item.all
    end

    def self.get_pokemon
        pokemon_data = JSON.parse(RestClient.get("#{BASE_URL}/pokemon"))
        pokemon_data["results"].each{|pokemon| Pokemon.new(pokemon["name"], pokemon["url"])}
        Pokemon.all
    end

    def self.test
        begin
            test = Pokemon.new("name", "#{BASE_URL}/shit")
        rescue => e
            e.response
        end
    end

    

    


end