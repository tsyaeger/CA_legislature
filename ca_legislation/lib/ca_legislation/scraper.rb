
# require 'nokogiri'
# require 'rubygems'
# require 'open-uri'


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

			if bill_type == "AB" || bill_type == "SB" && status == "Chaptered"
				bill = {}

				bill[:id] = bill_name.strip
				bill[:description] = post.css("td")[1].text
				bill[:author] = post.css("td")[2].text.upcase

				url = post.css("a").attribute('href').to_s
				bill_url_id = url.to_s.split("?")[1]
				bill[:url] = "https://leginfo.legislature.ca.gov/faces/billVotesClient.xhtml?#{bill_url_id}"

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
			representative[:house] = "ASSEMBLY"

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


	def self.scrape_senate

		senators = []

		page = scrape_page("http://senate.ca.gov/senators")
		sens = page.css(".block.block-views.clearfix .content .views-row")
		sens.each do |sen|

			representative = {}

			name_party = sen.css(".views-field-field-senator-last-name").css("h3").text.strip
			splt_name_party = name_party.split("(")
			representative[:last_name] = splt_name_party[0].split(" ")[-1].upcase
			representative[:first_name] = splt_name_party[0].split(" ")[0].upcase
			
			if splt_name_party[1]
				party_abv = splt_name_party[1].gsub(")","")
				if party_abv == "R"
					party = "REPUBLICAN"
				elsif party_abv == "D"
					party = "DEMOCRAT"
				else 
					party = party_abv
				end
			end

			representative[:party] = party
			district_str = sen.css(".views-field-field-senator-district").text.strip
			representative[:district] = district_str.split(" ")[1]
			representative[:contact_url] = sen.css(".views-field.views-field-field-senator-feedbackurl a").attribute("href").to_s
			representative[:house] = "SENATE"

			senators << representative	
		end
		senators	
	end



end





