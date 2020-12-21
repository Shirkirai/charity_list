class CharityList::Metrics

  attr_accessor :title, :mission_statement, :url, :orgs, :address, :mission_statement, :pp, :cont_cost
  @@all = []

  def initialize(title, url, address, mission_statement, pp, cont_cost)
    @title = title
    @mission_statement = mission_statement
    @url = url
    @address = address
    @mission_statement = mission_statement
    @pp = pp
    @cont_cost = cont_cost

    @orgs = orgs
    save
  end

  def self.all
    @@all
  end

  def add_to_category
    @orgs.metrics << self unless @orgs.metrics.include?(self)
  end

  def save
    @@all << self
  end
end
