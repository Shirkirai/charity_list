class CharityList::Scraper
    def self.scrape_categories
        doc = Nokogiri::HTML(open("https://www.charitywatch.org/top-rated-charities/all-charities"))

        categories = doc.css("div#list-all.tab-pane.fade.show.active h2.mb-3")

        category_names = categories.each do |c|
            title = c.text.strip
            CharityList::Charityorgs.new(title)
        end
    end

    def self.scrape_organizations(category)
      binding.pry
      CharityList::Organizations.new("VA", "aid")

      #doc = Nokogiri::HTML(open("https://www.charitywatch.org/top-rated-charities/all-charities"))

      #organizations = doc.css()

      #organization_names = organizations.each do |o|
        #title = o.text.strip

    end

end
