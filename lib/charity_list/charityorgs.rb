class CharityList::Charityorgs
    @@all = []

    attr_accessor :title, :organizations

    def initialize(title)
      @title = title
      @organizations = []
      save
    end

    def self.all
      CharityList::Scraper.scrape_categories if @@all.empty?
        @@all
    end

    def get_organizations
      #binding.pry
      CharityList::Scraper.scrape_organizations(self) if @organizations.empty?
    end

    def save
      @@all << self
    end
end
