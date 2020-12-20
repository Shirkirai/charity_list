class CharityList::Organization

  attr_accessor :title, :charityorgs :contribution_amount, :contribution_per_hundred, :expense, :budget_percentage
  @@all = []

  def initialize(title, charityorgs)
    @title = title
    @charityorgs = charityorgs
    add_to_charityorgs
    save
  end

  def self.all
    @@all
  end

  def add_to_charityorgs
    @charityorgs.organizations << self unless @charityorgs.organizations.include?(self)
  end

  def save
    @@all << self
  end
end
