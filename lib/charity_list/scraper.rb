class CharityList::Scraper
    def self.scrape_orgs
        #doc = Nokogiri::HTML(open("https://www.charitynavigator.org/index.cfm?bay=topten.detail&listid=148"))
        doc = Nokogiri::HTML(open("https://www.charitywatch.org/top-rated-charities"))

        #organizations = doc.css("div#topten tr.list-url-topten")
        organizations = doc.css("div#list-all.tab-pane.fade.show.active div.table-responsive table.table.mb-4 tbody tr td")

        organization_names = organizations.each do |o|
          #title = o.css("a.list-url-name").text.strip
          #url = o.css("a.list-url-name").attr('href').text
          title = o.css("a").text.strip
          url = o.css("a").attr('href').text
          binding.pry
          CharityList::Org.new(title, url)
        #categories = doc.css("div#list-all.tab-pane.fade.show.active")
        #puts categories.text.strip
        #category_names = categories.each do |c|
        #    title = c.text.strip
        #    CharityList::Category.new(title)
        end
    end

    def self.scrape_metrics(chosen_org)
      #doc = Nokogiri::HTML(open("https://www.charitynavigator.org/#{chosen_org.url}"))
      doc = Nokogiri::HTML(open("#{chosen_org.url}"))
      #metrics = doc.css("div #app.mm-page.mm-slideout div.container main#main setion.section div.row div.col-12.col.sm-6.col-lg-3 p")
      metrics = doc.css("")
      puts metrics
      binding.pry


      metrics_info = metris.each do |m|
        mission_statement = m.css("p").text
        CharityList::Metrics.new(mission_statement)
      end

    end

    #def self.scrape_organizations(category)
    #  doc = Nokogiri::HTML(open("https://www.charitywatch.org/top-rated-charities/all-charities"))



    #  organization_names = organizations.each do |o|
    #    title = o.css("td a").text.strip
    #    CharityList::Organization.new(title, category)
    #  end
    #end

end
