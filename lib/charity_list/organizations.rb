class CharityList::Organizations
  @@all = []

  attr_accessor :title, :category, :contribution_amount, :contribution_per_hundred, :expense, :budget_percentage

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
    binding.pry
  end

  def save
    @@all << self
  end
end
