class MoveMenu

    attr_accessor :cli

    def initialize(cli)
        self.cli = cli
    end

    def main_menu
        puts "\n\n"
        input = self.cli.prompt.select("What Move information would you like to get?", cycle: true) do |menu|
            menu.choice 'Get a list of Moves.', 1
            menu.choice 'Search for a Move by name.', 2
            menu.choice 'Search for a Move by Type.', 3
            menu.choice 'Get information from a random Move.', 4
            menu.choice 'Return to the main menu'.light_green, 5
            menu.choice 'Exit Dexter++'.light_red, 6
            
        end

        case input
        when 1
            self.list_moves
        when 2
            self.search_by_name
        when 3
            self.search_by_type
        when 4
            self.get_random
        when 5
            self.cli.main_menu
        when 6
            self.cli.exit_program
        end
    end

    def list_moves
        puts "\n\nHow many Moves would you like to list?"
        input = gets.strip.to_i
        until input.between?(1, Move.limit)
            if input <= 0 
                puts"That is not enough Moves! Try a bigger number"
                input = gets.strip.to_i
            else 
                puts "Thats way too many Moves! Try a smaller number."
                input = gets.strip.to_i
            end
        end
        puts "\n\nAwesome! Let me load that for you."
        puts"\n\n"
        options = Move.find_with_offset_and_limit(rand(0...Move.limit), input)
        self.display_move_options(options)
    end

    def search_by_name
        puts "\n\nWhat Move would you like to search for?"
        input = gets.strip.downcase
        puts "\n\nAwesome! Let me load that for you."
        move = API.get_move_by_name(input)
        move.print_all
        puts"\n\n"
        self.display_more_options(move)
    end

    def search_by_type(type = nil)
        if type
            puts "\n\nAwesome! Let me load that for you."
            puts "\n\n"
            options = Move.find_list_by_type(type.name)
            self.display_move_options(options)
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
            options = Move.find_list_by_type(input.downcase)
            self.display_move_options(options)
        end
    end

    def get_random
        move = API.get_random_move
        move.print_all
        puts"\n\n"
        self.display_more_options(move)
    end

    def self.list_moves(num)
        puts "\n\n"
        input =  @@prompt.select("What kind of list would you like to get?", cycle: true) do |menu|
            menu.choice 'Get a list of Moves of a certain size', 1
            menu.choice 'Get a list of Moves by type', 2
            menu.choice 'Return to main menu'.light_green, 3
            menu.choice 'Exit Dexter++'.light_red, 4
        end
        case input
        when 1
            puts "\n\nHow many Moves would you like to list?"
            input = gets.strip
            while !input.between?(1, Move.limit)
                if input >= 0 
                    puts"That is not enough Moves! Try a bigger number"
                    input = gets.strip
                else 
                    puts "Thats way too many Moves! Try a smaller number."
                    input = gets.strip
                end
            end
            puts "\n\nAwesome! Let me load that for you."
            puts"\n\n"
            options = Move.find_list_with_offset_and_limit(rand(0...Move.limit), input)
            self.display_move_options(options)
        when 2
            puts "\n\nWhat type of Moves would you like to list?"
            puts "\n\n"
            input = self.type_menu
            puts "\n\nAwesome! Let me load that for you."
            puts "\n\n"
            options = Move.find_by_type(input.downcase)
            self.display_move_options(options)
        when 3
            self.cli.exit_program
        when 4
            self.cli.main_menu
        end
    end

    def display_move_options(options)
        options.unshift("Exit Dexter++".light_red)
        options.unshift("Go back to main menu".light_green)
        choice = self.cli.get_menu_from_array(options)
        if choice == "Exit Dexter++".light_red
            self.cli.exit_program
        elsif choice == "Go back to main menu".light_green
            self.cli.main_menu
        else move = API.get_move_by_name(choice.downcase)
           move.print_all
           puts "\n\n\n"
        end
        self.display_more_options(move)
    end

    def display_more_options(move)
        puts "\n\n"
        input = self.cli.prompt.select("What information about #{move.name.capitalize} would you like to see?", cycle: true) do |menu|
            menu.choice 'Type information' , 1
            menu.choice 'Go back to main menu'.light_green, 2
            menu.choice 'Exit Dexter++'.light_red, 3
        end
        case input
        when 1
            move.type.print_all
            puts "\n\n"
            self.display_more_options(move)
        when 2
            self.cli.main_menu
        when 3
            self.cli.exit_program
        end
    end



end