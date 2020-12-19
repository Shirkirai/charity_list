class CharityList::Charityorgs
    @@all = ["a", 'b', 'c', 'd']

    attr_accessor :name

    def self.all
        @@all
    end
end
