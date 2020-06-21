class PokemonMenu

    attr_accessor :cli

    def initialize(cli)
        self.cli = cli
    end

    def main_menu
        puts"\n\n"
        input = self.cli.prompt.select("What Pokemon information would you like to get?", cycle: true) do |menu|
            menu.choice 'Get a list of Pokemon.', 1
            menu.choice 'Search for Pokemon by name', 2
            menu.choice 'Search for Pokemon by Type', 3
            menu.choice 'Search for Pokemon by Ability', 4
            menu.choice 'Search for Pokemon by Generation', 5
            menu.choice 'Get information from a random Pokemon', 6
            menu.choice 'Return to main menu'.light_green, 7
            menu.choice 'Exit Dexter++'.light_red, 8
        end
        case input
        when 1
            self.list_pokemon
        when 2
            self.search_by_name
        when 3
            self.search_by_type
        when 4
            self.search_by_ability
        when 5
            self.search_by_generation
        when 6
            self.get_random
        when 7 
            self.cli.main_menu
        when 8
            self.cli.exit_program
        end
    end

    def list_pokemon
        puts "\n\nHow many Pokemon would you like to list?"
        input = gets.strip.to_i
        until input.between?(1, Pokemon.limit)
            if input <= 0 
                puts"\nThat is not enough Pokemon! Try a bigger number"
                input = gets.strip.to_i
            else 
                puts "\nThats way too many Pokemon! Try a smaller number."
                input = gets.strip.to_i
            end
        end
        puts "\n\nAwesome! Let me load that for you."
        options = Pokemon.find_with_offset_and_limit(rand(0...Pokemon.limit), input)
        self.display_pokemon_options(options)
    end

    def search_by_name
        puts "\n\nWhat Pokemon would you like to search for?"
        input = gets.strip.downcase
        puts "\n\nAwesome! Let me load that for you."
        pokemon = API.get_pokemon_by_name(input)
        pokemon.print_all
        puts"\n\n"
        self.display_more_options(pokemon)
    end

    def search_by_type(type = nil)
        if type
            puts "\n\nAwesome! Let me load that for you."
            puts "\n\n"
            options = Pokemon.find_list_by_type(type.name)
            self.display_pokemon_options(options)
        else
            puts "\n\n"
            options = ["Normal","Flying","Poison","Ground",
                   "Rock","Bug","Ghost","Steel","Fire",
                   "Water","Grass","Electric","Psychic",
                   "Ice","Dragon","Dark","Fairy","Unknown",
                   "Shadow","Return to main menu".light_green, "Exit Dexter++".light_red]

            input = self.cli.prompt.select("Select a type to search for.", options, cycle: true)
        end

        case input
        when "Return to main menu".light_green
            self.cli.main_menu
        when "Exit Dexter++".light_red
            self.cli.exit_program
        else
            puts "\n\nAwesome! Let me load that for you."
            puts "\n\n"
            options = Pokemon.find_list_by_type(input.downcase)
            self.display_pokemon_options(options)
        end
    end

    def search_by_ability(ability = nil)
        if ability
            puts "\n\nAwesome! Let me load that for you."
            puts "\n\n"
            options = API.get_pokemon_list_by_ability(ability.name)
            self.display_pokemon_options(options)
        else
            puts "\n\nWhat Ability would you like your Pokemon to have?"
            input = gets.strip.downcase
            puts "\n\nAwesome! Let me load that for you."
            puts "\n\n"
            options = API.get_pokemon_list_by_ability(input)
            self.display_pokemon_options(options)
        end
    end

    def search_by_generation
        puts "\n\nWhat Generation of Pokemon would you like to list?"
        puts "\n\n" 
        input = self.generation_menu
        puts "\n\nAwesome! Let me load that for you."
        options = API.get_pokemon_list_by_generation(input)
        self.display_pokemon_options(options)
    end

    def get_random
       pokemon = API.get_random_pokemon
       pokemon.print_all
       puts"\n\n"
       self.display_more_options(pokemon)
    end

    def generation_menu
        choices = [1,2,3,4,5,6,7,"Back"]
        self.cli.prompt.select("Select a generation to search for.", choices, cycle: true)
    end

    def display_pokemon_options(options)
        puts "\n\n"
        options.unshift("Exit Dexter++".light_red)
        options.unshift("Go back to main menu".light_green)
        choice = self.cli.get_menu_from_array(options)
        if choice == "Exit Dexter++".light_red
            self.cli.exit_program
        elsif choice == "Go back to main menu".light_green
            self.cli.main_menu
        else pokemon = API.get_pokemon_by_name(choice.downcase)
            pokemon.print_all
            puts"\n\n"
            self.display_more_options(pokemon)
        end
    end

    def display_more_options(pokemon)
        puts "\n\n"
        input = self.cli.prompt.select("What information about #{pokemon.name.capitalize} would you like to see?", cycle: true) do |menu|
            menu.choice 'Type information.', 1
            menu.choice 'Moves information', 2
            menu.choice 'Abilities information', 3
            menu.choice 'Go back to main menu'.light_green, 4
            menu.choice 'Exit Dexter++'.light_red, 5
        end

        case input
        when 1
            pokemon.types.each{|type| type.print_all}
            puts "\n\n"
            self.display_more_options(pokemon)
        when 2
            pokemon.moves.each{|move| move.print_all}
            puts "\n\n"
            self.display_more_options(pokemon)
        when 3
            pokemon.abilities.each {|ability| ability.print_all}
            puts "\n\n"
            self.display_more_options(pokemon)
        when 4
            self.cli.main_menu
        when 5
            self.cli.exit_program
        end
    end


end