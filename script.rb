


class Script


	def intro_msg
		puts "Hello. Please select from the below options."

		puts "1) Find representative by district"
		puts "2) Find representative by name"
		puts "3) Find bills by author"
		puts "4) Find bills by id"
		puts "5) View all representatives"

		input = gets.strip
	end


	def find_rep_by_district
		puts "Enter district number"
		input = gets.strip
	end


	def find_rep_by_name
		puts "Enter representative's last name"
		input = gets.strip
	end


	def find_bills_by_author
		puts "Enter author's name"
		input = gets.strip
	end


	def find_bill_by_number
		puts "Enter bill id"
		input = gets.strip
	end


	def view_all_reps
		puts "CA representatives:"
	end


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


	def display_assembly(reps)
    	reps.each do |rep|
	      puts "#{rep.first_name} #{rep.last_name}".colorize(:blue)
	      puts "  district:".colorize(:light_blue) + " #{rep.district}"
	      puts "  party:".colorize(:light_blue) + " #{rep.party}"
	      puts "  contact info:".colorize(:light_blue) + " #{rep.contact_url}"
	      puts "----------------------".colorize(:green)
    	end
  	end	


end
