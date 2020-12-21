class CharityList::CLI
  def call
    puts "\nWelcome to Charity List!\n"
    @input = ""
    until @input == "exit"
      get_charity_orgs
      list_charity_orgs
      get_user_charity_org
      what_next?
    end
    thanks
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
      if valid_input(chosen_org, @charity_orgs)
        show_charity_metrics_for(chosen_org)
      else
        puts "Please put the correct number"
      end
  end


  def valid_input(input, data)
      input.to_i <= data.length && input.to_i > 0 && input!= ('a'..'z')
  end

  def show_charity_metrics_for(chosen_org)
      #category is the category within the @@all array corresponding to the user input.
      #for example, if the user input is 2, then it'll take the 2nd entry from the array. In this case, it'll be 2. AIDS Charities
    org = @charity_orgs[chosen_org - 1]
      #calls the get_organizations method from the Category Class to scrape organization data from the website
      #the method below should shovel all the scraped organizations into @organizations array
    metrics = org.get_metrics
    puts "\nHere are all the metrics under #{org.title}\n"
    puts "\nURL: #{metrics.url}\n"
    puts "\nAddress: #{metrics.address}\n"
    puts "\nMission Statement: #{metrics.mission_statement}\n"
    puts "\nProgram Percentage: #{metrics.pp}"
    puts "  *This is the Amount spent on programs relative to overhead*\n"
    puts "\nCost to Raise $100: #{metrics.cont_cost}\n"
    puts "  *Amount spent to raise $100 of contributions."
    puts ""
  end

  def what_next?
    puts "If you wish to see the list of charity organizations again, please type 'Y', but otherwise, please type 'exit'."
    @input = gets.strip
  end

  def thanks
    puts "Happy Charity Shopping!"
  end
end
