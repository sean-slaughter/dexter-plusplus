Dexter++ : A Ruby CLI PokeDex Gem
BASE URL: https://pokeapi.co/api/v2/

Model classes:

Pokemon:

        Attributes: Name
                    Type
                    Generation
                    Description
                    Moves
                    Abilities
Ability:

        Attributes: Name
                    Effect

Move:

        Attributes: Name
                    Accuracy
                    Power
                    PP
                    Type

Item:
        Attributes: Name
                    Effect

Service classes:

API:

    Methods:

                #Pokemon
            get_pokemon_by_name
            get_pokemon_by_type
            get_pokemon_by_generation
            get_pokemon_by_id

                #Ability
            get_ability_by_name
            get_ability_by_id

                #Move
            get_move_by_name
            get_move_by_type
            get_move_by_id

                #Item
            get_item_by_name
            get_item_by_id

CLI:

    Methods:

                run: runs everything
                greet_user: prints greeting
                main_menu: asks user for input
                load_data: loads data based on user input
                exit: exit program


TODO 6/16: 

    1. Create findable module and implement in classes
    2. Keep all class relationships assigned out of that class
    3. Figure out how to set ability, item and type attributes
    4. Create API class
    5. Create CLI class
    6. Write executable program (bring in ascii art)


TODO 6/18:

    1. Finish API class
    2. Make all objects printable (colorize)
    3. Start CLI class
    4. Reduce benchmark time if possible.
    Benchmarks -  26 sec for 20 Pokemon
               -  2:49 for 100 pokemon

TODO 6/18 end of day
    1. Test api methods
    2. Fix bugs
    3. Write CLI
    4. Test everything
    5. Update github docuementation
    6. Get to rubygems.org

TODO 6/19 end of day
    Add info to types
    Write CLI
    update github doc
    get to rubygems



BUGS!!! 
        

    
    -⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨
    


                ██████╗░███████╗██╗░░██╗████████╗███████╗██████╗░░░░░░░░░░░░░░░
                ██╔══██╗██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝██╔══██╗░░██╗░░░░██╗░░
                ██║░░██║█████╗░░░╚███╔╝░░░░██║░░░█████╗░░██████╔╝██████╗██████╗
                ██║░░██║██╔══╝░░░██╔██╗░░░░██║░░░██╔══╝░░██╔══██╗╚═██╔═╝╚═██╔═╝
                ██████╔╝███████╗██╔╝╚██╗░░░██║░░░███████╗██║░░██║░░╚═╝░░░░╚═╝░░
                ╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░░░░░░░░░░░░



                    🄰🄽 🄴🄽🄷🄰🄽🄲🄴🄳 🄿🄾🄺🄴🄳🄴🅇 🄱🅈 🅂🄴🄰🄽 🅃🄷🄾🄼🄿🅂🄾🄽


    -⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨-⃨



                    


                    
