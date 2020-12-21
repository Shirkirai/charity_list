class CharityList::Metrics

  attr_accessor :mission_statement, :url, :orgs
  @@all = []

  def initialize(mission_statement)
    @mission_statement
    @url = url
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
