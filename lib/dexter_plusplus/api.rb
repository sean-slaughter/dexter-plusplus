
class API

    def self.get_pokemon_by_name(pokemon)
        puts "Searching for #{pokemon}..."
        begin
            Pokemon.find_or_create_by_name(pokemon)
        rescue => e
            puts "Error loading Pokemon by name."
        end
    end

    def self.get_type_by_name(type)
        puts "Searching for #{type}..."
        begin
            Type.find_or_create_by_name(type)
        rescue => e
            puts "Error loading type by name."
        end
    end

    def self.get_move_by_name(move)
        puts "Searching for #{move}..."
        begin
            Type.find_or_create_by_name(move)
        rescue => e
            puts "Error loading move by name."
        end
    end

    def self.get_item_by_name(item)
        puts "Searching for #{item}..."
        begin
            Item.find_or_create_by_name(item)
        rescue => e
            puts "Error loading item by name."
        end
    end

    def self.get_items(num)
        puts "Getting #{num} items..."
        begin
            Item.find_with_offset_and_limit(rand(1...(Item.limit - num)), num)
        rescue => e
            puts "Error loading items."
        end
    end

    def self.get_pokemon(num)
        puts "Getting Pokemon..."
        begin
            Pokemon.find_with_offset_and_limit(rand(1...(Pokemon.limit - num)), num)
        rescue => e
            puts "Error loading Pokemon."
        end
    end

    def self.get_moves(num)
        puts "Getting moves..."
        begin
            Move.find_with_offset_and_limit(rand(1...(Move.limit - num)), num)
        rescue => e
            puts "Error loading moves."
        end
    end

    def self.get_types(num)
        puts "Getting types..."
        begin
            Move.find_with_offset_and_limit(rand(1...(Move.limit - num)), num)
        rescue => e
            puts "Error loading types."
        end
    end

    def self.get_abilities(num)
        begin
            Ability.find_with_offset_and_limit(rand(1...(Ability.limit - num)), num)
        rescue => e
            puts "Error loading abilities."
        end
    end

    def self.get_pokemon_by_type(type)
        puts "Getting all #{type} Pokemon..."
        begin
            Pokemon.find_by_type(type)
        rescue => e
            puts "Error loading Pokemon by Type."
        end
    end

    def self.get_moves_by_type(type)
        puts "Getting all #{type} moves..."
        begin
            Move.find_by_type(type)
        rescue => e
            puts "Error loading Moves by Type."
        end
    end

    def self.get_pokemon_by_generation(generation)
        
        case generation
        when 1
            puts "Finding Generation: 1"
            Pokemon.find_with_offset_and_limit(0, 151)
        when 2
            puts "Finding Generation: 2"
            Pokemon.find_with_offset_and_limit(151, 100)
        when 3
            puts "Finding Generation: 3"
            Pokemon.find_with_offset_and_limit(251, 135)
        when 4
            puts "Finding Generation: 4"
            Pokemon.find_with_offset_and_limit(386, 107)
        when 5
            puts "Finding Generation: 5"
            Pokemon.find_with_offset_and_limit(493, 156)
        when 6
            puts "Finding Generation: 6"
            Pokemon.find_with_offset_and_limit(649, 72)
        when 7
            puts "Finding Generation: 7"
            Pokemon.find_with_offset_and_limit(721, 86)
        else
            nil
        end
    end



end
