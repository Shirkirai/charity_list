class CharityList::CLI
  def call
    puts "Welcome to Charity List!"
    #get_charity_categories - provide the users with a list of charity categories to choose from
    get_charity_categories
    #get_user_charity_category(category) - take user's charity category of their choosing
    #get_charity_organizations_in_category - provides the users with a list of charity organizations within the category
    #list_charity_organizations
  end

  def get_charity_categories
      #list the charity categories
      #call the scraper method
      @category_list = [#scraper_method goes here]
  end
end
