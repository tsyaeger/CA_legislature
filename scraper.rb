require 'rubygems'
require 'open-uri'
require 'nokogiri'

class Scraper

	# senate_path = 'http://senate.ca.gov/leadership'
	# assembly_path = 'http://assembly.ca.gov/assemblymembers'
	# leg_path = 'http://leginfo.legislature.ca.gov/faces/billSearchClient.xhtml?session_year=20172018&house=Both&author=All&lawCode=All'
	# bill_path = "http://leginfo.legislature.ca.gov#{url}"



	def self.scrape_page(path)
		Nokogiri::HTML(open(path))
	end


	def self.scrape_leg
		leg_path = 'http://leginfo.legislature.ca.gov/faces/billSearchClient.xhtml?session_year=20172018&house=Both&author=All&lawCode=All'

		page = scrape_page(leg_path)

		puts page

	end


end



test = Scraper
test.scrape_leg