


require_relative "../Cli_leg_project/scraper.rb"
require_relative "../Cli_leg_project/bill.rb"
require_relative "../Cli_leg_project/rep.rb"
require_relative "../Cli_leg_project/party.rb"
require_relative "../Cli_leg_project/script.rb"


require 'nokogiri'


class CommandLineInterface

	def run
		make_reps
		make_bills
	end



	def make_reps
    	assembly_array = Scraper.scrape_assembly
    	Rep.create_from_collection(assembly_array)
  	end



	def make_bills
		bills_array = Scraper.scrape_leg
		Bill.create_from_collection(bills_array)
	end



  # 	def self.set_rep_party_obj
		# Rep.all.each{|rep| Party.add_member(rep)}
  # 	end

end


test = CommandLineInterface.new
test.run







# class Script

# 	def intro_msg
# 		puts "Hello. Please select from the below options."

# 		puts "1) Find representative by district"
# 		puts "2) Find representative by name"
# 		puts "3) Find bills by author"
# 		puts "4) Find bills by id"
# 		puts "5) View all representatives"

# 	def find_rep_by_district

# 	def find_rep_by_name

# 	def find_bills_by_author

# 	def find_bill_by_number

# 	def view_all_reps

	# def contact_q
	# 	puts "Would you like to contact your representative? (Y/N)"
	# 	input = gets.strip.upcase
	# end

	# def contact_representative(url)
	# 	open(url)
	# end


	# def bill_text_q(bill_id)
	# 	puts "Would you like to view the bill details online? (Y/N)"
	# 	input = gets.strip.upcase
	# end


	# def view_bill_details(url)
	# 	open(url)
	# end

	# def display_assembly(reps)



