class CharityList::Scraper
    def self.scrape_categories
        doc = Nokogiri::HTML(open("https://www.charitywatch.org/top-rated-charities/all-charities"))

        categories = doc.css("div#list-all.tab-pane.fade.show.active h2.mb-3")

        category_names = categories.each do |c|
            title = c.text.strip
            CharityList::Category.new(title)
        end
    end

    def self.scrape_organizations(category)
      CharityList::Organization.new("OMG", category)
      CharityList::Organization.new("HO HO HO", category)
      CharityList::Organization.new("NOOOO", category)
    end

end
