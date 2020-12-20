class CharityList::CLI
  def call
    puts "\nWelcome to Charity List!\n"
    #get_charity_categories - provide the users with a list of charity categories to choose from
    get_charity_orgs
    list_charity_orgs
    #get_user_charity_category
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
      @charity_orgs.each.with_index(1) do |category, index|
        puts "#{index}. #{category.title}" #had to put category.title to print out the actual names of the categories
      end
      #binding.pry
  end


  def get_user_charity_category
      chosen_category = gets.strip.to_i
      show_charity_organizations_for(chosen_category) if valid_input(chosen_category, @category_list)
      if !valid_input(chosen_category, @category_list)
        get_user_charity_category until valid_input
      end
  end


  def valid_input(input, data)
      input.to_i <= data.length && input.to_i > 0
  end

  def show_charity_organizations_for(chosen_category)
      #category is the category within the @@all array corresponding to the user input.
      #for example, if the user input is 2, then it'll take the 2nd entry from the array. In this case, it'll be 2. AIDS Charities
      category = @category_list[chosen_category - 1]
      #calls the get_organizations method from the Category Class to scrape organization data from the website
      #the method below should shovel all the scraped organizations into @organizations array
      category.get_organizations
      puts "Here are all the charity organizations under the #{category.title}"
      #binding.pry
      category.organizations.each.with_index(1) do |organization, index|
        puts "#{index}. #{organization.category.title} - #{organization.title}" #if index == chosen_category
      #  binding.pry
      end
  end


  def get_user_organization(category)
      puts "Choose an organization to see its metrics"
      input = gets.strip
      organization = category.organizations[input.to_i - 1]
      organization.get_user_organization
  end
end
