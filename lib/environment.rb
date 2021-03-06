require_relative "./charity_list/version"
require_relative "./charity_list/cli"
require_relative "./charity_list/org"
require_relative "./charity_list/scraper"
require_relative "./charity_list/metrics"

require 'pry'
require 'nokogiri'
#open uri is needed otherwise you'll get an error saying that 'no such file or directory available for the charity website"
require 'open-uri'

module CharityList
  class Error < StandardError; end
  # Your code goes here...
end
