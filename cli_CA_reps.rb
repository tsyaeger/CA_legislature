


require_relative "../Cli_leg_project/scraper.rb"
require_relative "../Cli_leg_project/bill.rb"
require_relative "../Cli_leg_project/rep.rb"
require_relative "../Cli_leg_project/party.rb"
require_relative "../Cli_leg_project/script.rb"


require 'nokogiri'


class CommandLineInterface

	def run

		script = Script.new

		input = script.intro_msg
		make_reps
		make_bills

		while input != "exit"

			case input 
			when "1"
				find_rep_by_district
				input = script.find_rep_by_district
				Rep.find_by_district(input)

			when "2"
				find_rep_by_name
				input = script.find_rep_by_name
				Rep.find_by_name(inpute)

			when "3"
				find_bills_by_author
				input = script.find_bills_by_author
				Bill.find_by_author(input)

			when "4"
				find_bill_by_number
				input = script.find_bill_by_number
				Bill.find_by_id(input)

			when "5"
				view_all_reps
				script.view_all_reps(Reps.all)

			else
				run # CHANGE ME - SHOULD NOT START FROM BEGINNING
			end
		end


		script.exit_message

	end



	def make_reps
    	assembly_array = Scraper.scrape_assembly
    	Rep.create_from_collection(assembly_array)
  	end


	def make_bills
		bills_array = Scraper.scrape_leg
		Bill.create_from_collection(bills_array)
	end




	def find_rep_by_district
		input = script.find_rep_by_district
		Rep.find_by_district(input)
	end


	def find_rep_by_name
		input = script.find_rep_by_name
		Rep.find_by_name(inpute)
	end


	def find_bills_by_author
		input = script.find_bills_by_author
		Bill.find_by_author(input)
	end

	def find_bill_by_number
		input = script.find_bill_by_number
		Bill.find_by_id(input)
	end










end


test = CommandLineInterface.new
test.run





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



