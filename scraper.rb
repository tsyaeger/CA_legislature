require 'rubygems'
require 'open-uri'
require 'nokogiri'


class Scraper


	def self.scrape_page(path)
		Nokogiri::HTML(open(path))
	end


	def self.scrape_leg
		leg_path = 'http://leginfo.legislature.ca.gov/faces/billSearchClient.xhtml?session_year=20172018&house=Both&author=All&lawCode=All'
		bills = []

		page = scrape_page(leg_path)
		legs = page.css("tbody tr")

		legs.each do |post|
			bill_name = post.css("a").text
			bill_type = bill_name.split("-")[0]
			status = post.css("td")[3].text

			if bill_type == "AB" && status == "Chaptered"
				bill = {}
				bill[:id] = bill_name.strip
				bill[:url] = post.css("a").attribute('href').to_s
				bill[:description] = post.css("td")[1].text
				bill[:author] = post.css("td")[2].text.upcase
		
				bills << bill
			end
		end
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

			whole_name = rep_row[0].text.gsub("[edit]","").split(",")
			representative[:last_name] = whole_name[0].strip.upcase
			representative[:first_name] = whole_name[1].strip.upcase
			representative[:district] = rep_row[1].text.strip
			representative[:party] = rep_row[2].text.strip.upcase
			representative[:contact_url] = rep.css("a")[2].attribute("href").to_s #NEED TO GET BY CLASS

			assemblymembers << representative
		end
		assemblymembers
	end



	# def self.get_leg_votes(url)
		
	# 	bill_id = url.to_s.split("?")[1]
	# 	vote_path = "https://leginfo.legislature.ca.gov/faces/billVotesClient.xhtml?#{url}"
	# 	doc = scrape_page(vote_path)

	# 	post = doc.css("tbody")

	# end




end



# test = Scraper
# test.scrape_leg
# test.scrape_assembly






