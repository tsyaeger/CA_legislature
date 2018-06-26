

class CaLegislation::Script


	def intro_msg
		puts "\nHello. Please select from the below options.\n"
	end


	def options_msg

		puts "\n"
		puts "1) Find representatives by district"
		puts "2) Find representative by name"
		puts "3) Find bills by author"
		puts "4) Find bills by id"
		puts "5) View all representatives"
		puts "6) Contact representative"
		puts "7) View bill details online"
		puts "Type 'exit' to quit"
		puts "\n"

		input = gets.strip.to_s.upcase
	end


	def find_reps_by_district
		puts "\nEnter district number\n"
		input = gets.strip
		if input.length == 1
			district = input.rjust(2, '0')
		else
			district == input
		end
		district
	end


	def view_reps_by_district(reps)
		puts "\n"
		reps.each do |rep|
			puts "#{rep.first_name} #{rep.last_name}".colorize(:blue) + " - #{rep.house} - #{rep.party.name}"
		end
		puts "\n"
	end


	def find_rep_by_name
		puts "\nEnter representative's last name\n"
		input = gets.strip.upcase
	end


	def find_rep_by_name_msg(rep)
		puts "\n#{rep.first_name} #{rep.last_name}".colorize(:blue)
		puts "#{rep.party.name}"
		puts "District: #{rep.district}\n" 
	end

	def district_notfound_msg
		puts "District not found. Enter '5' to view all representatives."
	end


	def rep_notfound_msg
		puts "Representative not found. Enter '5' to view all representatives."
	end


	def find_bills_by_author
		puts "\nEnter author's name\n"
		input = gets.strip.upcase
	end


	def view_bills_by_author(bills)
		puts "\n"
		bills.each do |bill|
        	puts "#{bill[0]}".colorize(:blue) + ": #{bill[1]}"
		end
      	puts "\n"
    end


	def find_bill_by_number
		puts "\nEnter bill id\n"
		input = gets.strip.upcase
	end


	def view_bill(bill)
		puts "view"
		puts "\n#{bill.id}".colorize(:blue) + " - Author: #{bill.author.last_name}, #{bill.author.first_name} - Description: #{bill.description}\n"
	end

	def bill_notfound_msg
		puts "Bill not found. Enter '3' to view bills by author."
	end

	def author_notfound_msg
		puts "No bills by that author found. Enter '5' to view all representatives."
	end

	def contact_rep_q
		puts "\nEnter last name of representative\n"
		input = gets.strip
	end


	def view_bill_online_q
		puts "\nEnter bill id\n"
		id = gets.strip.upcase
	end


	def view_all_reps_q
		puts "\n1) View by name\n2) View by district\n"
		input = gets.strip
	end


	def view_by_party_q
		puts "\n1) View all\n2) View Democrats\n3) View Republicans\n"
		input = gets.strip
	end


	def view_all_alpha_reps(rep)
		puts "#{rep.last_name}, #{rep.first_name} - #{rep.house} - #{rep.party.name} -" + " District #{rep.district}".colorize(:blue)
	end


	def view_by_house_q
		puts "\n1) View all\n2) View Senate\n3) View Assembly\n"
		input = gets.strip
	end


	def view_all_district_reps(rep)
		puts "D#{rep.district}".colorize(:blue) + ": #{rep.first_name} #{rep.last_name} - #{rep.party.name}"
	end


	def exit_message
		puts "Goodbye."
	end


end
