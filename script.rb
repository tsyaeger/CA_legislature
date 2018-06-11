


class Script



	def intro_msg
		puts "Hello. Please select from the below options."
	end


	def options_msg

		puts "\n"
		puts "1) Find representative by district"
		puts "2) Find representative by name"
		puts "3) Find bills by author"
		puts "4) Find bills by id"
		puts "5) View all representatives"
		puts "Type 'exit' to quit"
		puts "\n"

		input = gets.strip
	end


	def find_rep_by_district
		puts "Enter district number"
		input = gets.strip
		if input.length == 1
			district = input.rjust(2, '0')
		else
			district == input
		end
		district
	end


	def find_rep_by_name
		puts "Enter representative's last name"
		input = gets.strip.upcase
	end


	def find_bills_by_author
		puts "Enter author's name"
		input = gets.strip.upcase
	end


	def find_bill_by_number
		puts "Enter bill id"
		input = gets.strip
	end


	def view_all_reps
		puts "CA representatives:"
	end



	def view_all_reps_msg
		puts "1) View by name\n2) View by district"
		input = gets.strip
	end


	def rep_options_msg
		puts "1) Find bills by author\n2) Contact representative\n3) Return to main menu"
		input = gets.strip
	end


	def bill_options_msg
		puts "1) Find bills by author\n2) Contact representative\n3) Return to main menu"
		input = gets.strip
	end


# DOES NOT WORK - INCORPORATE THIS PRINTING FUNCTION INTO CLI
	# def view_reps_alpha(reps)
	# 	reps.sort_by(&:last_name).each do |rep|
	# 		puts "#{rep.last_name}, #{rep.first_name} - #{rep.party.name} - District #{rep.district}"
	# 	end
	# end


	# def view_reps_district(reps)
	# 	reps.sort_by(&:district).each do |rep|
	# 		puts "D#{rep.district}: #{rep.first_name} #{rep.last_name} - #{rep.party.name}"
	# 	end
	# end





	def contact_q
		puts "Would you like to contact your representative? (Y/N)"
		input = gets.strip.upcase
	end

	def contact_representative(url)
		open(url)
	end


	def bill_text_q(bill_id)
		puts "Would you like to view the bill details online? (Y/N)"
		input = gets.strip.upcase
	end


	def view_bill_details(url)
		open(url)
	end


	def exit_message
		puts "Goodbye."
	end


end
