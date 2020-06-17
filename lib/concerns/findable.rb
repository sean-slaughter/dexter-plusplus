module Findable

    BASE_URL = "https://pokeapi.co/api/v2"

    def find_or_create_by_name(name)
        url = "#{BASE_URL}/#{self.tag}/#{name.downcase}"
        if self.find_by_name(name)
            self.find_by_name(name)
        else
            self.new(name.downcase, url)
        end
    end

    def find_by_name(name)
        self.all.find{|i| i.name == name.capitalize}
    end




end