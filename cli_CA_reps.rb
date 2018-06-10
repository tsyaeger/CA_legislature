


require_relative "../Cli_leg_project/scraper.rb"
require_relative "../Cli_leg_project/bill.rb"
require_relative "../Cli_leg_project/rep.rb"
require_relative "../Cli_leg_project/party.rb"
require_relative "../Cli_leg_project/script.rb"


require 'nokogiri'


class CommandLineInterface


	attr_accessor :script 

	def initialize
		@script = Script.new 
	end


	def run

		@script.intro_msg

		make_reps
		make_bills
		options 

		script.exit_message

	end


	def options

		input = @script.options_msg.to_s		

		while input != "exit"

			case input 
			when "1"
				find_rep_by_district

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



	def make_reps
    	assembly_array = Scraper.scrape_assembly
    	Rep.create_from_collection(assembly_array)
  	end


	def make_bills
		bills_array = Scraper.scrape_leg
		Bill.create_from_collection(bills_array)
	end



	def find_rep_by_district
		input = @script.find_rep_by_district
		rep = Rep.find_by_district(input)
		puts "#{rep.first_name} #{rep.last_name}"
		puts "#{rep.party.name}"



		# FIND BILLS BY AUTHOR? 
		find_bills_by_author


		# CONTACT REP
		# contact_rep(rep.last_name)

		options

	end


	def find_rep_by_name
		input = @script.find_rep_by_name
		Rep.find_by_name(input)
	end


	def find_bills_by_author
		input = @script.find_bills_by_author
		Bill.find_by_author(input)
		options
	end

	def find_bill_by_number
		input = @script.find_bill_by_number
		Bill.find_by_id(input)
	end


	def contact_rep(last_name)
		url = Rep.find_rep_url(last_name)
		open(url)
	end


	def get_bill_details

	end


	def view_all_reps

		puts "1) View by name\n2) View by district"
		input = gets.strip

		puts "District count: #{Rep.all.count}\n"

		if input == '1'
		#Alphabetically
			Rep.all.collect{|rep| puts "#{rep.last_name}, #{rep.first_name} - #{rep.party.name} - District #{rep.district}"}

		elsif input == '2'
		#By District
			Rep.all.sort_by(&:district).each do |rep|
				puts "#{rep.district}: #{rep.first_name} #{rep.last_name} - #{rep.party.name}"
			end
		end

		options
	end




	# def list_songs_by_genre
	# 	puts "Please enter the name of a genre:"
	# 	get_genre = gets.strip
	# 	if genre = Genre.find_by_name(get_genre)
	# 		genre.songs.sort_by(&:name).each.with_index(1) do |song,ix|
	# 			puts "#{ix}. #{song.artist.name} - #{song.name}"
	# 		end
	# 	end
	# end


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



