class CharityList::Charityorgs
    @@all = []

    attr_accessor :title, :organization

    def initialize(title)
      @title = title
      save
    end

    def self.all
      CharityList::Scraper.scrape_categories if @@all.empty?
        @@all
    end

    def save
      @@all << self
    end
end
