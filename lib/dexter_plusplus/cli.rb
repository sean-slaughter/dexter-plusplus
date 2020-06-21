class CLI

    @@prompt = TTY::Prompt.new

    def greeting
        puts "              -⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨
    


        ██████╗░███████╗██╗░░██╗████████╗███████╗██████╗░░░░░░░░░░░░░░░
        ██╔══██╗██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝██╔══██╗░░██╗░░░░██╗░░
        ██║░░██║█████╗░░░╚███╔╝░░░░██║░░░█████╗░░██████╔╝██████╗██████╗
        ██║░░██║██╔══╝░░░██╔██╗░░░░██║░░░██╔══╝░░██╔══██╗╚═██╔═╝╚═██╔═╝
        ██████╔╝███████╗██╔╝╚██╗░░░██║░░░███████╗██║░░██║░░╚═╝░░░░╚═╝░░
        ╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░░░░░░░░░░░░



                     🄰🄽 🄴🄽🄷🄰🄽🄲🄴🄳 🄿🄾🄺🄴🄳🄴🅇 🄱🅈 🅂🄴🄰🄽 🅃🄷🄾🄼🄿🅂🄾🄽


               -⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨"
        puts"\n\n\n\n Welcome to Dexter++! Your personal tool for exploring the Pokemon universe!"
        puts"\n\n"
    end

    def good_bye
        puts "
            
            ██████╗  ██████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███████╗██╗
            ██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██║
            ██║  ███╗██║   ██║██║   ██║██║  ██║██████╔╝ ╚████╔╝ █████╗  ██║
            ██║   ██║██║   ██║██║   ██║██║  ██║██╔══██╗  ╚██╔╝  ██╔══╝  ╚═╝
            ╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝██████╔╝   ██║   ███████╗██╗
            ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝
                                                                            
                                                   
      "
    end

    def main_menu
        puts "\n\n\n\n"
        input =  @@prompt.select("What would you like to do?", cycle: true) do |menu|
            menu.choice 'Get Pokemon information.' , 1
            menu.choice 'Get Item information', 2
            menu.choice 'Get Move information', 3
            menu.choice 'Get Ability information', 4
            menu.choice 'Get Type information', 5
            menu.choice 'Exit Dexter++'.light_red , 6
        end
        case input
        when 1
            menu = PokemonMenu.new(self)
            menu.main_menu
        when 2
           menu = ItemMenu.new(self)
           menu.main_menu
        when 3
            menu = MoveMenu.new(self)
            menu.main_menu
        when 4
            menu = AbilityMenu.new(self)
            menu.main_menu
        when 5
            menu = TypeMenu.new(self).main_menu
        when 6
            self.exit_program
        end
    end

    def run
        self.greeting
        self.main_menu
    end

    def prompt
        @@prompt
    end

    def type_menu
        @@prompt.select("Select a type to search for.", %w(Normal Flying Poison Ground Rock Bug Ghost Steel Fire Water Grass Electric Psychic Ice Dragon Dark Fairy Unknown Shadow Back ), cycle: true)
    end

    def get_menu_from_array(array)
        @@prompt.select("\n\n\nSelect an option to see more information.\n", array, cycle: true)
    end

    def exit_program
        puts"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        puts"\t\tHope you enjoyed using Dexter++! See you again soon!"
        puts"\n\n\n"
        self.good_bye
        puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        begin
            exit
        rescue SystemExit
            
        end
    end

end