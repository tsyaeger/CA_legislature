
require 'bundler'
require 'nokogiri'
require 'colorize'
require 'rubygems'
require 'open-uri'

require_relative "../Cli_leg_project/scraper.rb"
require_relative "../Cli_leg_project/bill.rb"
require_relative "../Cli_leg_project/rep.rb"
require_relative "../Cli_leg_project/party.rb"
require_relative "../Cli_leg_project/script.rb"



class CommandLineInterface


	attr_accessor :script, :rep, :bill

	def initialize
		@script = Script.new 
		@rep_viewing = nil
		@bill_viewing = nil
	end


	def run

		@script.intro_msg

		make_assembly
		make_senate
		make_bills
		options 

		@script.exit_message

	end


	def options

		input = @script.options_msg.to_s.upcase	

		while input != "EXIT"

			case input 
			when "1"
				find_reps_by_district

			when "2"
				find_rep_by_name

			when "3"
				find_bills_by_author

			when "4"
				find_bill_by_number

			when "5"
				view_all_reps

			else
				options 
			end
		end
	end



	def make_assembly
    	assembly_array = Scraper.scrape_assembly
    	Rep.create_from_collection(assembly_array)
  	end

  	def make_senate
    	senate_array = Scraper.scrape_senate
    	Rep.create_from_collection(senate_array)
  	end


	def make_bills
		bills_array = Scraper.scrape_leg
		Bill.create_from_collection(bills_array)
	end




	def find_reps_by_district
		input = @script.find_rep_by_district
		reps = Rep.find_by_district(input)
		puts "\nDISTRICT: #{input}".colorize(:blue)
		reps.each do |rep|
			puts "#{rep.house} - #{rep.first_name} #{rep.last_name} - #{rep.party.name}"
		end
		rep_options
	end



	def find_rep_by_name
		input = @script.find_rep_by_name
		@rep = Rep.find_by_name(input)
		puts "#{@rep.first_name} #{@rep.last_name}"
		puts "#{@rep.party.name}"
		puts "#{@rep.district}" 

		rep_options
	end


	def rep_options
		puts "rep options"
		input = @script.rep_options_msg

		if input == '1'
			find_bills_by_author
		elsif input == '2'
			contact_rep
		else
			options
		end
	end




	def find_bills_by_author
		input = @script.find_bills_by_author
		bills = Bill.find_by_author(input)
		
		bill_options
	end



	def find_bill_by_number
		input = @script.find_bill_by_number
		@bill = Bill.find_by_id
		@rep = @bill.author
		puts "#{bill.id} - Author: #{bill.author.last_name}, #{bill.author.first_name} - Description: #{bill.description}"
		
		bill_options
	end



	def bill_options
		input = @script.bill_options_msg

		if input == '1'
			view_bill_online(id)
		elsif input == '2'
			contact_rep
		elsif input == '3'
			find_rep_by_name
		else
			options
		end
	end




	def view_bill_online(id= @bill.id)
		bill = find_bill_by_number(id)
		open(bill.url)
	end

	def contact_rep(last_name=@rep.last_name)
		rep = Rep.find_rep_by_name(last_name)
		open(rep.contact_url)
	end




	def view_all_reps

		input = @script.view_all_reps_msg

		if input == '1'
		#Alphabetically
			Rep.all.sort_by(&:last_name).each do |rep|
				puts "#{rep.last_name}, #{rep.first_name} - #{rep.house} - #{rep.party.name} -" + " District #{rep.district}".colorize(:blue)
			end

		elsif input == '2'
			#BY DISTRICT
			puts "1) View Senate\n2) View Assembly"
			input = gets.strip

			if input == "1"
				senate = []
				Rep.all.each{|rep| senate << rep if rep.house == "SENATE"}

				senate.sort_by(&:district).each do |rep|
					puts "D#{rep.district}".colorize(:blue) + ": #{rep.first_name} #{rep.last_name} - #{rep.party.name} - #{rep.party.name}"
				end

			elsif input == "2"
				assembly = []

				Rep.all.each do |rep|
					assembly << rep if rep.house == "ASSEMBLY"
				end

				assembly.sort_by(&:district).each do |rep|
					puts "D#{rep.district}".colorize(:blue) + ": #{rep.first_name} #{rep.last_name} - #{rep.party.name} - #{rep.party.name}"
				end
			end
		end
		rep_options
	end


end


test = CommandLineInterface.new
test.run





	# def contact_q
	# 	puts "Would you like to contact your representative? (Y/N)"
	# 	input = gets.strip.upcase
	# end



