module Creatable

    def create_from_array(array)
        output = []
        array.each do |i|
            output << self.new(i["#{self.tag}"]["name"], i["#{self.tag}"]["url"])
        end
        output
    end
end