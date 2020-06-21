class AbilityMenu
    
    attr_accessor :cli

    def initialize(cli)
        self.cli = cli
    end

    def main_menu
        puts "\n\n"
        input = self.cli.prompt.select("What Ability information would you like to get?", cycle: true) do |menu|
            menu.choice 'Get a list of Abilities', 1
            menu.choice 'Search for an Ability name', 2
            menu.choice 'Get information from a random Ability', 3
            menu.choice 'Return to the main menu'.light_green, 4
            menu.choice 'Exit Dexter++'.light_red, 5
        end

        case input
        when 1
            self.list_abilities
        when 2
            self.search_by_name
        when 3
            self.get_random
        when 4
            self.cli.main_menu
        when 5
            self.cli.exit_program
        end
    end

    def list_abilities
        puts "\n\nHow many Abililities would you like to list?"
        input = gets.strip.to_i
        until input.between?(1, Ability.limit)
            if input <= 0 
                puts"That is not enough Abilities! Try a bigger number"
                input = gets.strip.to_i
            else 
                puts "Thats way too many Abilities! Try a smaller number."
                input = gets.strip.to_i
            end
        end
        puts "\n\nAwesome! Let me load that for you."
        puts"\n\n"
        options = Ability.find_with_offset_and_limit(rand(0...Ability.limit), input)
        self.display_ability_options(options)
    end

    def search_by_name
        puts "\n\nWhat Ability would you like to search for?"
        input = gets.strip.downcase
        puts "\n\nAwesome! Let me load that for you."
        ability = API.get_ability_by_name(input)
        ability.print_all
        puts"\n\n"
        self.display_more_options(ability)
    end

    def get_random
        ability = API.get_random_ability
        ability.print_all
        puts"\n\n"
        self.display_more_options(ability)
    end

    def display_ability_options(options)
        options.unshift("Exit Dexter++".light_red)
        options.unshift("Go back to main menu".light_green)
        choice = self.cli.get_menu_from_array(options)
        if choice == "Exit Dexter++".light_red
            self.cli.exit_program
        elsif choice == "Go back to main menu".light_green
            self.cli.main_menu
        else ability = API.get_ability_by_name(choice.downcase)
           ability.print_all
           puts "\n\n\n"
           self.display_more_options(ability)
        end
    end

    def display_more_options(ability)
        puts "\n\n"
        input = self.cli.prompt.select("What information about #{ability.name.capitalize} would you like to see?", cycle: true) do |menu|
            menu.choice 'See list of Pokemon with this ability' , 1
            menu.choice 'Go back to main menu'.light_green, 2
            menu.choice 'Exit Dexter++'.light_red, 3
        end
        case input
        when 1
            menu = PokemonMenu.new(self.cli)
            menu.search_by_ability(ability)
        when 2
            self.cli.main_menu
        when 3
            self.cli.exit_program
        end
    end

end