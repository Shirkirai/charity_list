class CharityList::CLI
  def call
    puts "\nWelcome to Charity List!\n"
    #get_charity_categories - provide the users with a list of charity categories to choose from
    get_charity_orgs
    list_charity_orgs
    get_user_charity_org
    #get_user_charity_category(category) - take user's charity category of their choosing
    #get_charity_organizations_in_category - provides the users with a list of charity organizations within the category
    #list_charity_organizations
  end

  def get_charity_orgs
      #list the charity categories
      #can test by using the fake data below
      #Fake Data 1: CharityList::Charityorgs.new("AIDS")
      #Fake Data 2: CharityList::Charityorgs.new("VA")
      @charity_orgs = CharityList::Org.all
      #binding.pry
  end

  def list_charity_orgs
      puts "\nPlease type in the number corresponding to a specific charity organization to see its metrics\n"
      @charity_orgs.each.with_index(1) do |org, index|
        puts "#{index}. #{org.title} | #{org.url}" #had to put category.title to print out the actual names of the categories
        #binding.pry
      end
      #binding.pry
  end


  def get_user_charity_org
      chosen_org = gets.strip.to_i
      show_charity_metrics_for(chosen_org) if valid_input(chosen_org, @charity_orgs)
      if !valid_input(chosen_org, @charity_orgs)
        get_user_charity_org until valid_input
      end
  end


  def valid_input(input, data)
      input.to_i <= data.length && input.to_i > 0
  end

  def show_charity_metrics_for(chosen_org)
      #category is the category within the @@all array corresponding to the user input.
      #for example, if the user input is 2, then it'll take the 2nd entry from the array. In this case, it'll be 2. AIDS Charities
    org = @charity_orgs[chosen_org - 1]

      #calls the get_organizations method from the Category Class to scrape organization data from the website
      #the method below should shovel all the scraped organizations into @organizations array
    org.get_metrics
    puts "Here are all the metrics under #{org.metrics}"
  #  binding.pry
  end


  def get_user_organization(category)
      puts "Choose an organization to see its metrics"
      input = gets.strip
      organization = category.organizations[input.to_i - 1]
      organization.get_user_organization
  end
end
