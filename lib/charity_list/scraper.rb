class CharityList::Scraper
    def self.scrape_categories
        doc = Nokogiri::HTML(open("https://www.charitywatch.org/top-rated-charities/all-charities"))

        #categories = doc.css("div#list-all.tab-pane.fade.show.active h2.mb-3")
        categories = doc.css("div#list-all.tab-pane.fade.show.active")
        puts categories
        #category_names = categories.each do |c|
        #    title = c.text.strip
        #    CharityList::Category.new(title)
        #end
    end

    def self.scrape_organizations(category)
      doc = Nokogiri::HTML(open("https://www.charitywatch.org/top-rated-charities/all-charities"))

      organizations = doc.css("div#list-all.tab-pane.fade.show.active div.table-responsive table.table.mb-4 tbody tr")

      organization_names = organizations.each do |o|
        title = o.css("td a").text.strip
        CharityList::Organization.new(title, category)
      end
    end

end
