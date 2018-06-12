


class CaLegislation::CommandLineInterface

	attr_accessor :script


	def initialize
		@script = Script.new 
	end

	def run
		@script.intro_msg
		create_leg_objects
		user_options 
		@script.exit_message
	end

	def user_options
		input = ""
		
		while input != "EXIT"
			input = @script.options_msg

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
			when "6"
				contact_rep
			when "7"
				view_bill_online
			when 'EXIT'
				break  
			else
				user_options 
			end
		end
	end




	def create_leg_objects
		make_assembly
		make_senate
		make_bills
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
		input = @script.find_reps_by_district
		reps = Rep.find_by_district(input)
		@script.view_reps_by_district(reps)
	end

	def find_rep_by_name
		input = @script.find_rep_by_name
		rep = Rep.find_by_name(input)
		@script.find_rep_by_name_msg(rep)

	end

	def contact_rep
		input = @script.contact_rep_q
		rep = Rep.find_by_name(input)
		`open #{rep.contact_url}`

	end




	def find_bills_by_author
		input = @script.find_bills_by_author
		bills = Bill.find_by_author(input)
		@script.view_bills_by_author(bills)

	end

	def find_bill_by_number
		input = @script.find_bill_by_number
		bill = Bill.find_by_id(input)
		@script.view_bill(bill)	

	end

	def view_bill_online
		input = @script.view_bill_online_q
		bill = Bill.find_by_id(input)
		`open #{bill.url}`

	end





	def view_all_reps

		sort_input = @script.view_all_reps_q 

		if sort_input == '1' # ALPHABETICALLY
			party_input = @script.view_by_party_q
			party_sort(party_input)

		elsif sort_input == '2' # BY DISTRICT
			house_input = @script.view_by_house_q
			house_sort(house_input)

		end
	end


	def party_sort(party_input)

		case party_input

		when '1' # ALL
			Rep.all.sort_by(&:last_name).each{|rep| @script.view_all_alpha_reps(rep)}

		when '2' 
			democrats = []
			Rep.all.each{|rep| democrats << rep if rep.party.name == "DEMOCRAT"}
			democrats.sort_by(&:last_name).each{|rep| @script.view_all_alpha_reps(rep)}

		when '3'
			republicans = []
			Rep.all.each{|rep| republicans << rep if rep.party.name == "REPUBLICAN"}
			republicans.sort_by(&:last_name).each{|rep| @script.view_all_alpha_reps(rep)}

		else
			view_all_reps

		end
	end



	def house_sort(house_input)

		case house_input

		when "1" # ALL
			Rep.all.sort_by(&:district).each {|rep|	@script.view_all_district_reps(rep)}

		when "2"
			senate = []
			Rep.all.each{|rep| senate << rep if rep.house == "SENATE"}
			senate.sort_by(&:district).each {|rep| @script.view_all_district_reps(rep)}

		when "3"
			assembly = []
			Rep.all.each{|rep| assembly << rep if rep.house == "ASSEMBLY"}
			assembly.sort_by(&:district).each {|rep| @script.view_all_district_reps(rep)}

		else
			view_all_reps

		end
	end



end





