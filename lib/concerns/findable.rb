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

    def find_by_type(type)
        output = []
        data = JSON.parse(RestClient.get("#{BASE_URL}/type/#{type}/"))
        if self.tag == "pokemon"
            data["#{self.tag}"].each{|i| output << self.find_or_create_by_name(i["#{self.tag}"]["name"])}
        elsif self.tag == "move"
            data["#{self.tag}s"].each{|i| output << self.find_or_create_by_name(i["name"])}
        end
        output
    end

    # def find_random(offset = rand(0...self.limit))
    #     output = []
    #     if offset
    #         data = JSON.parse(RestClient.get("#{BASE_URL}/#{self.tag}?limit=#{self.limit}&offset=#{offset}"))
    #         data["results"].each{|i| output << self.find_or_create_by_name(i["name"])}
    #     else
    #         data = JSON.parse(RestClient.get("#{BASE_URL}/#{self.tag}?limit=10"))
    #         data["results"].each{|i| output << self.find_or_create_by_name(i["name"])}
    #     end
    #     output
    # end

    def find_with_offset_and_limit(offset, limit = rand(0...self.limit))
        output = []
        url = "#{BASE_URL}/#{self.tag}?limit=#{limit}&offset=#{offset}"
        data = JSON.parse(RestClient.get(url))
        data["results"].each{|i|output << self.find_or_create_by_name(i["name"])}
        output
    end
 

end