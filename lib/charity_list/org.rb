class CharityList::Org
    @@all = []

    attr_accessor :title, :url, :metrics

    def initialize(title, url)
      @title = title
      @url = url
      @metrics = []
      save
    end

    def self.all
      CharityList::Scraper.scrape_orgs if @@all.empty?
      @@all
    end

    def get_metrics
      CharityList::Scraper.scrape_metrics(self) if @metrics.empty?
    end

    def save
      @@all << self
    end
end
