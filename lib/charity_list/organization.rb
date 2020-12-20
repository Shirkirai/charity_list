class CharityList::Organization

  attr_accessor :title, :category, :contribution_amount, :contribution_per_hundred, :expense, :budget_percentage
  @@all = []

  def initialize(title, category)
    @title = title
    @category = category
    add_to_category
    save
  end

  def self.all
    @@all
  end

  def add_to_category
    @category.organizations << self unless @category.organizations.include?(self)
  end

  def get_organization_metrics
    #CharityList::Scraper.scrape_organizations
  end

  def save
    @@all << self
  end
end
