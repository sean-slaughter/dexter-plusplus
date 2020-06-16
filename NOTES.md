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

