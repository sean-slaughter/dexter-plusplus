class TypeMenu

    attr_accessor :cli

    def initialize(cli)
        self.cli = cli
    end

    def main_menu
        puts "\n\n"
        options = ["Normal","Flying","Poison","Ground",
                   "Rock","Bug","Ghost","Steel","Fire",
                   "Water","Grass","Electric","Psychic",
                   "Ice","Dragon","Dark","Fairy","Unknown",
                   "Shadow","Return to main menu".light_green, "Exit Dexter++".light_red]

        input = self.cli.prompt.select("Select a type to search for.", options, cycle: true)
        if input == "Return to main menu".light_green
            self.cli.main_menu
        elsif input == "Exit Dexter++".light_red
            self.cli.exit_program
        else
            type = API.get_type_by_name(input.downcase)
            type.print_all
            self.display_more_options(type)
        end

    end

    def display_more_options(type)
        puts "\n\n"
        input = self.cli.prompt.select("What information about #{type.name.capitalize} do you want to see?", cycle: true) do |menu|
            menu.choice 'See Pokemon of this type', 1
            menu.choice 'See Moves of this type', 2
            menu.choice 'Return to main menu'.light_green, 3
            menu.choice 'Exit Dexter++'.light_red, 4
        end

        case input
        when 1
            menu = PokemonMenu.new(self.cli)
            menu.search_by_type(type)
        when 2
            menu = MoveMenu.new(self.cli)
            menu.search_by_type(type)
        when 3
            self.cli.main_menu
        when 4
            self.cli.exit_program
        end

    end


        





end