
class API

    BASE_URL = "https://pokeapi.co/api/v2/"


    def self.get_pokemon
        response = RestClient.get(BASE_URL + "pokemon/bulbasaur")
        data = JSON.parse(response)
        binding.pry
    end

    


end