class CharityList::CLI
  def call
    puts "\nWelcome to Charity List!\n"
    #get_charity_categories - provide the users with a list of charity categories to choose from
    get_charity_categories
    list_charity_categories
    get_user_charity_category
    #get_user_charity_category(category) - take user's charity category of their choosing
    #get_charity_organizations_in_category - provides the users with a list of charity organizations within the category
    #list_charity_organizations
  end

  def get_charity_categories
      #list the charity categories
      @category_list = CharityList::Charityorgs.all
  end

  def list_charity_categories
      puts "\nPlease type in the number corresponding to a specific category to see charity organizations listed under it\n"
      @category_list.each.with_index(1) do |category, index|
          puts "#{index}. #{category}"
      end
  end

  def get_user_charity_category
      chosen_category = gets.strip.to_i
      show_charity_organizations_for(chosen_category) if valid_input(chosen_category, @category_list)

  end

  def valid_input(input, data)
      input.to_i <= data.length && input.to_i > 0
  end

  def show_charity_organizations_for(chosen_category)
      category = @category_list[chosen_category - 1]
      puts "Here are all the charity organizations under the #{category}"
      binding.pry
      #need to insert the scraper class here to provide the charity organization names and the specific metrics for them"
      #CharityList::Charitylist.all.each_with_index do | charity|
        #  puts charity.name
      #end

  end
end
