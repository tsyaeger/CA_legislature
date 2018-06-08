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

		bills = []

		page = scrape_page(leg_path)
		legs = page.css("tbody tr")
		# puts legs
		# puts "\n"

		legs.each do |post|

			bill_name = post.css("a").text
			bill_type = bill_name.split("-")[0]
			status = post.css("td")[3].text

			# puts bill_name
			# puts bill_type
			# puts status

			if bill_type == "AB" && status == "Chaptered"
				bill = {}

				bill[:name] = bill_name.strip
				bill[:url] = post.css("a").attribute('href').to_s
				bill[:description] = post.css("td")[1].text
				bill[:author] = post.css("td")[2].text
		
				bills << bill
			end
		end
		puts bills
		bills
	end


	def self.scrape_assembly
		assembly_path = 'http://assembly.ca.gov/assemblymembers'

		assemblymembers = []

		page = scrape_page(assembly_path)

		assembly = page.css("tbody tr")

		assembly.each do |rep|
			representative = {}

			rep_row = rep.css("td")

			r_name = rep_row[0].text.strip
			whole_name = r_name.gsub("[edit]","").split(",")
			representative[:last_name] = whole_name[0]
			representative[:first_name] = whole_name[1].strip
			representative[:district] = rep_row[1].text.strip
			representative[:party] = rep_row[2].text.strip
			representative[:contact_url] = rep.css("a")[2].attribute("href").to_s #NEED TO GET BY CLASS



			assemblymembers << representative

		end
		assemblymembers

	end






end



test = Scraper
# test.scrape_leg
test.scrape_assembly






