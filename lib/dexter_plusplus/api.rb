
class API

    BASE_URL = "https://pokeapi.co/api/v2/"


    def self.get_pokemon
        response = RestClient.get(BASE_URL + "move/1/")
        data = JSON.parse(response)
        binding.pry
    end

    


end