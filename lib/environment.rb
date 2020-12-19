require_relative "./charity_list/version"
require_relative "./charity_list/cli"
require_relative "./charity_list/charityorgs"
require_relative "./charity_list/scraper"

require 'pry'
require 'nokogiri'

module CharityList
  class Error < StandardError; end
  # Your code goes here...
end
