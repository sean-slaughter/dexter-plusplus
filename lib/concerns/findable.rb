module Findable

    BASE_URL = "https://pokeapi.co/api/v2"

    def find_or_create_by_name(name)
        url = "#{BASE_URL}/#{self.tag}/#{name}"
        if self.find_by_name(name).nil?
            self.new(name, url)
        else
            self.find_by_name(name)
        end
    end

    def find_by_name(name)
        self.all.find{|i| i.name == name}
    end

    def find_by_type(type)
        output = []
        data = JSON.parse(RestClient.get("#{BASE_URL}/type/#{type}/"))
        if self.tag == "pokemon"
            data["#{self.tag}"].each{|i| output << i["#{self.tag}"]["name"]}
        elsif self.tag == "move"
            data["#{self.tag}s"].each{|i| output << i["name"]}
        end
        output
    end


    def find_with_offset_and_limit(offset = rand(0...self.limit), limit = 1)
        output = []
        url = "#{BASE_URL}/#{self.tag}?limit=#{limit}&offset=#{offset}"
        data = JSON.parse(RestClient.get(url))
        data["results"].each{|i|output << i["name"].capitalize}
        output
    end

    def find_list_by_type(type)
        output = []
        url = "#{BASE_URL}/type/#{type}"
        data = JSON.parse(RestClient.get(url))
        if self.tag == "move"
            data["moves"].each{|i| output << i["name"].capitalize}
        else
            data["pokemon"].each{|i| output << i["pokemon"]["name"].capitalize}
        end
        output
    end

    def find_random
        self.find_or_create_by_name(self.find_with_offset_and_limit()[0].downcase)
    end

    def find_from_array(array)
        output = []
        array.each do |i|
            output << self.find_or_create_by_name(i["#{self.tag}"]["name"])
        end
        output
    end
end