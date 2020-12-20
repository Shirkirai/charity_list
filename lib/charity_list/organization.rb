class CharityList::Organization

  attr_accessor :title, :charityorg, :contribution_amount, :contribution_per_hundred, :expense, :budget_percentage
  @@all = []

  def initialize(title, charityorg)
    @title = title
    @charityorg = charityorg
    add_to_charityorgs
    save
  end

  def self.all
    @@all
  end

  def add_to_charityorg
    @charityorg.get_organizations << self unless @charityorg.get_organizations.include?(self)
  end

  def save
    @@all << self
  end
end
