class ItemMenu
    attr_accessor :cli

    def initialize(cli)
        self.cli = cli
    end

    def main_menu
        puts "\n\n"
        input = cli.prompt.select("What Item information would you like to get?", cycle: true) do |menu|
            menu.choice 'Get a list of Items', 1
            menu.choice 'Search for an Item by name', 2
            menu.choice 'Get information from a random Item', 3
            menu.choice 'Return to main menu'.light_green, 4
            menu.choice 'Exit Dexter++'.light_red, 5
        end
        case input
        when 1
            self.list_items
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

    def list_items
        puts "\n\nHow many items would you like to list?"
        input = gets.strip.to_i
        until input.between?(1, Item.limit)
            if input <= 0 
                puts"\nThat is not enough Items! Try a bigger number"
                input = gets.strip.to_i
            else 
                puts "\nThats way too many Items! Try a smaller number."
                input = gets.strip.to_i
            end
        end
        puts "\n\nAwesome! Let me load that for you."
        puts"\n\n"
        options = Item.find_with_offset_and_limit(rand(0...Item.limit), input)
        self.display_item_options(options)
    end

    def get_random
        item = API.get_random_item
        item.print_all
        puts"\n\n"
        self.main_menu
    end

    def search_by_name
        puts "\n\nWhat Item would you like to search for?"
        input = gets.strip.downcase
        puts "\n\nAwesome! Let me load that for you."
        item = API.get_item_by_name(input)
        item.print_all
        puts"\n\n"
        self.main_menu
    end

    def display_item_options(options)
        options.unshift("Exit Dexter++".light_red)
        options.unshift("Go back to main menu".light_green)
        choice = self.cli.get_menu_from_array(options)
        if choice == "Exit Dexter++".light_red
            self.exit
        elsif choice == "Go back to main menu".light_green
            self.main_menu
        else item = API.get_item_by_name(choice.downcase)
            puts "\n\n\n"
           item.print_all
        end
        puts "\n\n"
        self.main_menu
    end
        

end