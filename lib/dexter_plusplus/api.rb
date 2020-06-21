
class API

    #listing helpers
    
    def self.get_pokemon_list_by_type(type)
        output = []
        begin
            puts "\n\n"
            puts "Getting list of #{type.capitalize} Pokemon..."
            puts "\n\n"
            data = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/type/#{type}"))
            index = 0
            data["pokemon"].each{|pokemon| output << pokemon["pokemon"]["name"].capitalize}
        rescue => e
            puts "Error loading list of Pokemon with #{ability}"
            puts e.message
        end
        output
    end

    def self.get_pokemon_list_by_ability(ability)
        output = []
        begin
            puts "\n\n"
            puts "Getting list of Pokemon with #{ability}..."
            puts "\n\n"
            data = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/ability/#{ability}"))
            index = 0
            data["pokemon"].each{|pokemon| output << pokemon["pokemon"]["name"].capitalize}
        rescue => e
            puts "Error loading list of Pokemon with #{ability}"
            puts e.message
        end
        output
    end

    def self.get_pokemon_list_by_generation(gen)
        begin
            puts "Getting list of Generation #{gen} Pokemon..."
            puts "\n\n"
            case gen
            when 1
                Pokemon.find_with_offset_and_limit(0, 151)
            when 2
                Pokemon.find_with_offset_and_limit(151, 100)  
            when 3
                Pokemon.find_with_offset_and_limit(251, 135)  
            when 4
                Pokemon.find_with_offset_and_limit(386, 107)  
            when 5
                Pokemon.find_with_offset_and_limit(493, 156) 
            when 6
                Pokemon.find_with_offset_and_limit(649, 72)  
            when 7
                Pokemon.find_with_offset_and_limit(721, 86)   
            else
                nil
            end
        rescue => e
            puts "Error loading generation."
            puts e.message
        end
    end

    #Returning Pokemon objects
    def self.get_pokemon_by_name(pokemon)
        puts "\n\n"
        puts "Searching for #{pokemon.capitalize}..."
        puts "\n\n"
        begin
            Pokemon.find_or_create_by_name(pokemon)
        rescue => e
            puts "Error loading Pokemon by name."
            puts e.message
        end
    end
    
    def self.get_random_pokemon
        puts "\n\n"
        puts "Searching for random Pokemon..."
        puts "\n\n"
        begin
            Pokemon.find_random
        rescue => e
            puts "Error loading random Pokemon"
            puts e.message
        end
    end

    #Returning Type objects

    def self.get_type_by_name(type)
        puts "\n\n"
        puts "Searching for #{type}..."
        puts "\n\n"
        begin
            Type.find_or_create_by_name(type)
        rescue => e
            puts "Error loading type by name."
        end
    end

    def self.get_random_type
        puts "\n\n"
        puts "Searching for random Type..."
        puts "\n\n"
        begin
            Type.find_random
        rescue => e
            puts "Error loading random Type"
            puts e.message
        end
    end

    #Returning move objects

    def self.get_move_by_name(move)
        puts "\n\n"
        puts "Searching for #{move}..."
        puts "\n\n"
        begin
            Move.find_or_create_by_name(move)
        rescue => e
            puts "Error loading move by name."
        end
    end
    
    def self.get_random_move
        puts "\n\n"
        puts "Searching for random Move..."
        puts "\n\n"
        begin
            Move.find_random
        rescue => e
            puts "Error loading random Move"
            puts e.message
        end
    end
    #Returning Item objects
    def self.get_item_by_name(item)
        puts "\n\n"
        puts "Searching for #{item}..."
        begin
            Item.find_or_create_by_name(item)
        rescue => e
            puts "Error loading item by name."
        end
    end
    
    def self.get_random_item
        puts "\n\n"
        puts "Searching for random Item..."
        puts "\n\n"
        begin
            Item.find_random
        rescue => e
            puts "Error loading random Item"
            puts e.message
        end
    end

    #Returning Ability objects
    def self.get_ability_by_name(ability)
        puts "\n\n"
        puts "Searching for #{ability}..."
        begin
            Ability.find_or_create_by_name(ability)
        rescue => e
            puts "Error loading item by name."
        end
    end
    
    def self.get_random_ability
        puts "\n\n"
        puts "Searching for random Ability..."
        puts "\n\n"
        begin
            Ability.find_random
        rescue => e
            puts "Error loading random ability"
            puts e.message
        end
    end

end
